#!/bin/bash
set -e

# Função para criar um usuário e um banco de dados
create_user_and_database() {
    local database=$1
    local owner=$2
    local password=$3
    echo "  Criando usuário e banco de dados '$owner'"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER $owner WITH PASSWORD '$password';
        CREATE DATABASE $database;
        GRANT ALL PRIVILEGES ON DATABASE $database TO $owner;
EOSQL
}

# Função para carregar dados de um arquivo SQL
load_sql_file() {
    local database=$1
    local owner=$2
    local sql_file=$3
    echo "  Carregando dados do arquivo SQL '$sql_file' no banco de dados '$database'"
    psql -v ON_ERROR_STOP=1 --username "$owner" --dbname "$database" -f $sql_file
}
