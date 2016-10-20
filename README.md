# L's geocoding service

Geocoder and reverse geocoder using Pelias

## Deploy

- Build and up elasticsearch: `docker-compose -f docker-compose.es.yml up --build -d`
- Get IP address of elasticsearch container `docker inspect lpelias_elasticsearch_1 | grep \"IPAddress\"`
- Set the IP address in pelias docker-compose build args `ES_IP`
- Build Pelias `docker-compose -f docker-compose.pelias.yml build`
- Up all containers `docker-compose -f docker-compose.es.yml -f docker-compose.pelias.yml up -d`
