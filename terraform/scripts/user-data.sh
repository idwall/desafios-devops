#!/bin/bash

# atualizacao da base de dados do repositorio
yum update -y

# instalacao do docker
yum install docker -y 

# inicalizacao do servico e habilitando para que inicie, em caso de reinicializacao da instancia
systemctl enable docker && systemctl start docker

# iniciando container do apache
docker run -p 80:80 -d httpd