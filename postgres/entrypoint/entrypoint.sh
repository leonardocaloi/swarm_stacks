#!/bin/bash
set -e

# Importa as funções do script functions.sh
source /entrypoint/functions.sh

# Chamada das funções para criar os usuários/bancos de dados e criar as tabelas/inserir dados
create_user_and_database 'database1' 'user1' 'senha1'
load_sql_file 'database1' 'user1' '/entrypoint/sql/data1.sql'

create_user_and_database 'database2' 'user2' 'senha2'
load_sql_file 'database2' 'user2' '/entrypoint/sql/data2.sql'

create_user_and_database 'database3' 'user3' 'senha3'
load_sql_file 'database3' 'user3' '/entrypoint/sql/data3.sql'
