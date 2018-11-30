#!/bin/bash

npm install
npm run production
docker-compose -f docker-compose.yml up -d --build

