#!/bin/sh
set -e

: "${MYSQL_ROOT_PASSWORD:?Missing MYSQL_ROOT_PASSWORD}"
: "${MYSQL_DATABASE:?Missing MYSQL_DATABASE}"
: "${MYSQL_USER:?Missing MYSQL_USER}"
: "${MYSQL_PASSWORD:?Missing MYSQL_PASSWORD}"

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Installation MariaDB..."
    
    mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

    echo "User configuration..."
    
    cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;

DELETE FROM     mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';

FLUSH PRIVILEGES;
EOF

    /usr/bin/mariadbd --user=mysql --bootstrap < /tmp/create_db.sql
    
    rm -f /tmp/create_db.sql
    echo "Initialization finished"
else
    echo "DB already created"
fi

echo "Start of mariadb"
exec /usr/bin/mariadbd --user=mysql --bind-address=0.0.0.0 --port=3306
