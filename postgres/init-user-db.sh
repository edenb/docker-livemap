#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER livemap;
    CREATE DATABASE livemapdb;
    GRANT ALL PRIVILEGES ON DATABASE livemapdb TO livemap;
EOSQL
