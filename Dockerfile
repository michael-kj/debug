FROM registry.cn-shanghai.aliyuncs.com/publish-kj/debug
ADD debug /app/debug
ADD init.sh /app/init.sh
WORKDIR /app
RUN rm -rf /termshark_2.1.1_linux_x64
RUN wget https://mirrors.host900.com/snail007/goproxy/proxy-linux-amd64.tar.gz
RUN tar -xzvf proxy-linux-amd64.tar.gz
RUN cp /app/proxy /usr/local/bin/
CMD ["/app/init.sh"]

