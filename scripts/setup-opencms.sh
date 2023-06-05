#!/bin/bash

# Instalação do Java 11 LTS
sudo apt-get update
sudo apt install -y openjdk-11-jre-headless  

# Instalação do dos2unix
sudo apt-get install -y dos2unix

# Download e instalação do Tomcat 9.0.75
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.zip

#Download do unzip
sudo apt install -y unzip

#Descompactar o tomcar para um diretório
sudo unzip apache-tomcat-9.0.75.zip -d /opt/tomcat

#Navegar até a pasta /bin do Tomcat
cd /opt/tomcat/apache-tomcat-9.0.75/bin/

# Permissões de execução para a /bin do Tomcat
sudo chmod +x *.sh

#Inicialização do servidorTomcat
sudo ./startup.sh

# Download do OpenCms 15.0
cd /home/ubuntu
sudo wget  http://www.opencms.org/downloads/opencms/opencms-15.0.zip

#Implantação da aplicação OpenCms no servidor Tomcat
sudo unzip opencms-15.0.zip -d /opt/tomcat/apache-tomcat-9.0.75/webapps/

# Reinicia o Tomcat
sudo /opt/tomcat/apache-tomcat-9.0.75/bin/shutdown.sh
sudo /opt/tomcat/apache-tomcat-9.0.75/bin/startup.sh
