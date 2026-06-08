FROM alpine:3.22

RUN apk update && apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY tools/generate_ssl.sh /usr/local/bin/generate_ssl.sh

RUN chmod +x /usr/local/bin/generate_ssl.sh \
 && /usr/local/bin/generate_ssl.sh

CMD ["nginx", "-g", "daemon off;"]
