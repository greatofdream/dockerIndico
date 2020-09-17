#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER indico;
    CREATE DATABASE indico OWNER indico;
    GRANT ALL PRIVILEGES ON DATABASE indico TO indico;
EOSQL
psql indico -c "CREATE EXTENSION unaccent; CREATE EXTENSION pg_trgm;"
