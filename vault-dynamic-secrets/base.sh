docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=training -d postgres &
docker exec -it postgres psql -U postgres -c 'CREATE DATABASE myapp;' &>/dev/null
