#!/bin/bash

gateway_container_id=$(docker ps --filter "name=gateway" --format "{{.ID}}")
frontend_container_id=$(docker ps --filter "name=frontend" --format "{{.ID}}")
backend_container_id=$(docker ps --filter "name=backend" --format "{{.ID}}")
db_container_id=$(docker ps --filter "name=db" --format "{{.ID}}")

docker commit $gateway_container_id openmrs/openmrs-reference-application-3-gateway:e2e
docker commit $frontend_container_id openmrs/openmrs-reference-application-3-frontend:e2e
docker commit $backend_container_id openmrs/openmrs-reference-application-3-backend:e2e
docker commit $db_container_id openmrs/openmrs-reference-application-3-db:e2e

docker save frontend gateway backend db | gzip > e2e_release_env_images.tgz
