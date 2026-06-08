FROM alpine:3.22

RUN apk update && apk add --no-cache \
    mariadb \
    mariadb-client \
    bash

RUN mkdir -p /run/mysqld /var/lib/mysql \
 && chown -R mysql:mysql /run/mysqld /var/lib/mysql

RUN echo "[mysqld]\n\
bind-address=0.0.0.0\n\
port=3306\n\
skip-networking=0\n" > /etc/my.cnf.d/network.cnf

COPY tools/init-db.sh /usr/local/bin/init-db.sh
RUN chmod +x /usr/local/bin/init-db.sh

RUN rm -f /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["/usr/local/bin/init-db.sh"]

