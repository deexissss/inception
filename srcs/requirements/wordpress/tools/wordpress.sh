#!/bin/sh
set -e

echo "Starting WordPress..."

until mysqladmin ping \
  -h"$MYSQL_HOST" \
  -u"$MYSQL_USER" \
  -p"$MYSQL_PASSWORD" \
  --silent; do
  echo "Wainting MariaDB..."
  sleep 2
done

if [ ! -f /var/www/html/wp-config.php ]; then
  echo "Installation WordPress..."

  curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz
  tar -xzf wordpress.tar.gz --strip-components=1 -C /var/www/html
  rm wordpress.tar.gz
  WP_PATH=/var/www/html
  wp config create \
    --path="$WP_PATH" \
    --dbname="$MYSQL_DATABASE" \
    --dbuser="$MYSQL_USER" \
    --dbpass="$MYSQL_PASSWORD" \
    --dbhost="$MYSQL_HOST" \
    --allow-root

  wp core install \
    --path="$WP_PATH" \
    --url="$DOMAIN_NAME" \
    --title="Inception" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root

  wp user create \
    "$WP_USER" "$WP_EMAIL" \
    --path="$WP_PATH" \
    --user_pass="$WP_PASSWORD" \
    --allow-root
fi

echo "Starting PHP-FPM..."
php-fpm83 -F

