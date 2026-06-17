#!/bin/bash

DOCKER_USER="scabraltome"

cd ~/UTNFRA_SO_2do_TP_CABRAL/docker

docker build -t "$DOCKER_USER/web2_cabral:latest" .

docker run -d -p 8080:80 --name web_parcial "$DOCKER_USER/web2_cabral:latest"

docker push "$DOCKER_USER/web2_cabral:latest"
