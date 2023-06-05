#!/bin/bash

# Atualiza os pacotes disponíveis no sistema
sudo apt-get update

# Instala o PostgreSQL
sudo apt install -y postgresql

# Acessa a conta de usuário "postgres" do PostgreSQL
sudo su - postgres

# Conecta-se ao banco de dados "postgres" como o usuário "postgres"
psql -d postgres -U postgres

# Altera a senha do usuário "postgres"
alter user postgres with password 'minhasenha';

