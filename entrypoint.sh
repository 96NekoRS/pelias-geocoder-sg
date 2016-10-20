#!/bin/bash
set -eu

if [ ! -d /usr/share/elasticsearch/data/elasticsearch/nodes/0/indices/pelias ]; then
  # Wait for Elasticsearch to be available
  until echo > /dev/tcp/elasticsearch/9200; do
    echo "Waiting for elasticsearch to start..."
    sleep 3
  done
  echo "Elasticsearch started!"

  # Set up the Elasticsearch Schema
  cd $HOME/schema
  node scripts/create_index.js

  # Run the importers
  cd $HOME/openaddresses
  node import.js

  cd $HOME/openstreetmap
  npm start

  cd $HOME/geonames
  npm run download_metadata
  npm start
fi

cd $HOME/api
npm start
