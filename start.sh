#!/bin/bash

docker-compose build

docker-compose up -d
docker exec -it kali_linux bash
