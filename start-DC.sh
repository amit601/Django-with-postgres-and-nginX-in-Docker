#!/bin/bash

##

printf "\nStopping Docker-Compose\n"
## add --scale app=count  to scale up the application.
## sudo docker-compose up -d  --scale djangoapp=4 will launch 4 container for django app.
sudo docker-compose up -d
printf "\nDocker service stack is Stopped\n"
