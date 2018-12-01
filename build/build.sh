#!/bin/bash

npm install
npm run production
docker-compose -f docker-compose.production.yml up -d --build

