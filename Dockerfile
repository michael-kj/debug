FROM registry.cn-shanghai.aliyuncs.com/publish-kj/debug:v0.1 
ADD web /app/web
CMD ["/app/web"]

