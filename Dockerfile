FROM registry.cn-shanghai.aliyuncs.com/publish-kj/debug
ADD debug /app/debug
RUN rm -rf /termshark_2.1.1_linux_x64
CMD ["/app/debug"]

