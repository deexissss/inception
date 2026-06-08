## ENVIRONMENT SETUP

You need multiple tool to run this project:
-make
-docker
-docker-compose

You will need the sudo privilege

Create a .env file with all the env variable for configuration

```DOMAIN_NAME=username.42.fr

MYSQL_DATABASE=wordpress
MYSQL_USER=username42
MYSQL_PASSWORD=usernamepasswd42
MYSQL_ROOT_PASSWORD=usernamepasswd42
MYSQL_HOST=mariadb

WP_ADMIN_USER=username42
WP_ADMIN_PASSWORD=usernamepasswd42
WP_ADMIN_EMAIL=username42@student.42luxembourg.lu

WP_USER=user
WP_PASSWORD=userpsw
WP_EMAIL=user@student.42luxembourg.lu
```


## HOW TO RUN THE PROJECT


Before running the project, you must map the domain name to your local machine.
Open your hosts file   : `sudo vim /etc/hosts`
Add the following line : `127.0.0.1 tjehaes.42.fr`

The project has a Makefile that execute everything

To execute the project : `make`
To clear the project   : `make clean`
To delete everything   : `make fclean`
To close the docker    : `make down`

## CONTAINER MANAGEMENT

Multiple interesting command:

docker logs [container_name] -> to check the logs of a docker
docker exec -it mariadb mariadb -u root -p -h 127.0.0.1 -> to acces inside a docker


to check the access.log from nginx

enter in the docker -> docker exec -it nginx sh

cat /var/log/nginx/access.log
