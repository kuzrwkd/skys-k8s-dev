#!make
include envfile

##
# build
#
build-dev-core:
	cd ${SKYS_CORE_ROOT_PATH} && docker build --no-cache -t dev-skys-core -f docker/dev.dockerfile .

build-dev-cli:
	cd ${SKYS_CLI_ROOT_PATH} && docker build --no-cache -t dev-skys-cli -f docker/dev.dockerfile .

build-dev-dynamodb:
	docker build --no-cache -t dev-skys-dynamodb db/dynamodb/docker

build-dev-api:
	cd ${SKYS_API_ROOT_PATH} && docker build --no-cache -t dev-skys-api -f docker/dev.dockerfile .

build-dev-scraper:
	cd ${SKYS_SCRAPER_ROOT_PATH} && docker build --no-cache -t dev-skys-scraper -f docker/dev.dockerfile .

build-dev-elasticsearch:
	cd ${SKYS_ELASTICSEARCH_ROOT_PATH} && docker build --no-cache -t dev-skys-elasticsearch -f docker/dev.elasticsearch.dockerfile .

build-dev-kibana:
	cd ${SKYS_ELASTICSEARCH_ROOT_PATH} && docker build --no-cache -t dev-skys-kibana -f docker/dev.kibana.dockerfile .

##
# clean
#
clean-dev-core:
	docker rmi dev-skys-core

clean-dev-cli:
	docker rmi dev-skys-cli

clean-dev-api:
	docker rmi dev-skys-api

clean-dev-scraper:
	docker rmi dev-skys-scraper

clean-dev-dynamodb:
	docker rmi dev-skys-dynamodb

clean-dev-elasticsearch:
	docker rmi dev-skys-elasticsearch

clean-dev-kibana:
	docker rmi dev-skys-kibana

##
# apply
#
install-core:
	helm install skys-core-app core/node --debug --set container.volume.project_root_path=${SKYS_CORE_ROOT_PATH}

install-cli:
	helm install skys-cli-app cli/node --debug --set container.volume.project_root_path=${SKYS_CLI_ROOT_PATH}

install-api:
	helm install skys-api-app api/node --debug --set container.volume.project_root_path=${SKYS_API_ROOT_PATH}

install-scraper:
	helm install skys-scraper-app scraper/node --debug --set container.volume.project_root_path=${SKYS_SCRAPER_ROOT_PATH}

install-dynamodb:
	helm install skys-dynamodb db/dynamodb --debug

install-elasticsearch:
	helm install skys-elasticsearch elasticsearch/node --debug --set container.volume.project_root_path=${SKYS_ELASTICSEARCH_ROOT_PATH},container.env.elastic_password=${SKYS_ELASTIC_PASSWORD}

##
# delete
#
uninstall-core:
	helm uninstall skys-core-app

uninstall-cli:
	helm uninstall skys-cli-app

uninstall-api:
	helm uninstall skys-api-app

uninstall-scraper:
	helm uninstall skys-scraper-app

uninstall-dynamodb:
	helm uninstall skys-dynamodb

uninstall-elasticsearch:
	helm uninstall skys-elasticsearch
