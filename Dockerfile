FROM nginx:1.19.3-alpine
ENV TZ=Asia/Shanghai
RUN apk add --no-cache --virtual .build-deps ca-certificates bash curl unzip php7

ADD default.conf.template /etc/nginx/conf.d/default.conf.template
ADD nginx.conf /etc/nginx/nginx.conf
ADD static-html /usr/share/nginx/html/index
ADD h5-speedtest /usr/share/nginx/html/speedtest
ADD configure.sh /configure.sh
ADD v2ray_config /
RUN chmod +x /configure.sh

ENTRYPOINT ["sh", "/configure.sh"]
