#!/bin/bash

# Atualização dos pacotes
sudo apt update

# Instalação do Nginx
sudo apt install nginx -y

# Criação de uma cópia do arquivo default
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default-original

# Apagar todo conteúdo do arquivo default
sudo truncate -s 0 /etc/nginx/sites-available/default

# Edição do arquivo default com o proxy pass usando o comando echo
sudo echo "
server {
    listen 80;
    server_name $MY_PUBLIC_DNS; 
    location / {
        proxy_pass http://localhost:8080/opencms/overview;
    }
}" >>  /etc/nginx/sites-available/default

# Reinicialização do serviço do Nginx
sudo service nginx restart

# Verificação do status do Nginx
sudo systemclt status nginx