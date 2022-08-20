#!make
include envfile

##
# build
#
build-core:
	docker build --no-cache -t skys-core:nodejs core/node/docker

build-cli:
	docker build --no-cache -t skys-cli:nodejs cli/node/docker

build-dynamodb:
	docker build --no-cache -t skys-dynamodb db/dynamodb/docker

build-api:
	docker build --no-cache -t skys-api:nestjs api/node/docker

build-scraper:
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs scraper/node/docker

##
# clean
#
clean-core:
	docker rmi skys-core:nodejs

clean-cli:
	docker rmi skys-cli:nodejs

clean-api:
	docker rmi skys-api:nestjs

clean-scraper:
	docker rmi skys-scraper:puppeteer-with-nestjs

clean-dynamodb:
	docker rmi skys-dynamodb

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
	helm install skys-scraper-app scraper/node --debug --set container.volume.project_root_path=${SKYS_SCRAPER_ROOT_PATH},container.pm2io.public_key=${PM2_PUBLIC_KEY},container.pm2io.secret_key=${PM2_SECRET_KEY}

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
