# Pelias geocoder

Get Pelias geocoder up and running quickly with Singapore data

```bash
# Start geocoder
docker-compose up -d
```

Geocoder is accessible at http://localhost:3100, e.g. http://localhost:3100/v1/search?text=sandcrawler

API docs are available at https://github.com/pelias/pelias-doc

*It is assumed that you have docker and docker compose installed on your machine*


### Building from source

Build the libpostal, pelias and elasticsearch images

```bash
docker build -t chrissng/libpostal -f Dockerfile-libpostal .
docker-compose build pelias
docker-compose build elasticsearch
```

### Data

Data used by the geocode is located in `es/data/`. They are elasticsearch data.
