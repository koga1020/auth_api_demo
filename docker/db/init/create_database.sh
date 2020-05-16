databases=(${POSTGRES_DEV_DB} ${POSTGRES_TEST_DB})

for database in ${databases[@]}; do
    psql --username ${POSTGRES_USER} -c "CREATE DATABASE ${database};"
    psql --username ${POSTGRES_USER} -c "GRANT ALL PRIVILEGES ON DATABASE ${database} TO ${POSTGRES_USER}"
done
