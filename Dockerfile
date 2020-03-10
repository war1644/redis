# redis 镜像（alpine linux)
# author duanxuqiang@ucse.net
FROM registry.cn-beijing.aliyuncs.com/dxq_docker/base

# 一些工作目录准备
RUN apk add --no-cache redis && \
    # 去掉安全模式
    sed -i "s|protected-mode yes|protected-mode no|" /etc/redis.conf && \
    sed -i "s|daemonize yes|daemonize no|" /etc/redis.conf && \
    sed -i "s|bind 127.0.0.1|# bind 127.0.0.1|" /etc/redis.conf
    #sed -i "s|port 6379|port 6793|" /etc/redis.conf && \
    #sed -i "s|# requirepass foobared|requirepass ucsexuemaoserver|" /etc/redis.conf
EXPOSE 6379
CMD ["redis-server","/etc/redis.conf"]