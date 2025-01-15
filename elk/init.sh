docker compose down
sh ./elasticsearch/init.sh
sh ./logstash/init.sh
docker compose up -d