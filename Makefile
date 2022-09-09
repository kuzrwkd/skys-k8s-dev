#!make
include envfile

##
# build
#
dev-build-core:
	cd ${SKYS_CORE_ROOT_PATH} && docker build --no-cache -t dev-skys-core -f docker/dev.dockerfile .

dev-build-cli:
	cd ${SKYS_CLI_ROOT_PATH} && docker build --no-cache -t dev-skys-cli -f docker/dev.dockerfile .

dev-build-dynamodb:
	docker build --no-cache -t dev-skys-dynamodb db/dynamodb/docker

dev-build-api:
	cd ${SKYS_API_ROOT_PATH} && docker build --no-cache -t dev-skys-api -f docker/dev.dockerfile .

dev-build-scraper:
	cd ${SKYS_SCRAPER_ROOT_PATH} && docker build --no-cache -t dev-skys-scraper -f docker/dev.dockerfile .

##
# clean
#
dev-clean-core:
	docker rmi dev-skys-core

dev-clean-cli:
	docker rmi dev-skys-cli

dev-clean-api:
	docker rmi dev-skys-api

dev-clean-scraper:
	docker rmi dev-skys-scraper

dev-clean-dynamodb:
	docker rmi dev-skys-dynamodb

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
