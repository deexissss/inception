# HOW TO RUN THE PROJECT


Before running the project, you must map the domain name to your local machine.
Open your hosts file   : `sudo vim /etc/hosts`
Add the following line : `127.0.0.1 tjehaes.42.fr`
To execute the project : `make`
To clear the project   : `make clean`
To delete everything   : `make fclean`
To close the docker    : `make down`

When the docker is compiled, you can access this site : https://tjehaes.42.fr

You can manage all the creditentials inside the .env file.

You can see the docker running with the command `docker ps`
