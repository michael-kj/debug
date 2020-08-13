FROM registry.cn-shanghai.aliyuncs.com/publish-kj/debug
ADD web /app/web
RUN rm -rf /termshark_2.1.1_linux_x64
CMD ["/app/web"]

