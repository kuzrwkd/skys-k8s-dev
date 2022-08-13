#!make
include envfile

##
# build
#
build-all:
	docker build --no-cache -t skys-core:nodejs core/node/docker
	docker build --no-cache -t skys-api:nestjs api/node/docker
	docker build --no-cache -t skys-dynamodb db/dynamodb/docker
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs scraper/node/docker

build-core:
	docker build --no-cache -t skys-core:nodejs core/node/docker

build-api:
	docker build --no-cache -t skys-api:nestjs api/node/docker

build-scraper:
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs scraper/node/docker

build-db:
	docker build --no-cache -t skys-dynamodb db/dynamodb/docker

##
# clean
#
clean-all:
	docker rmi skys-core:nodejs
	docker rmi skys-api:nestjs
	docker rmi skys-scraper:puppeteer-with-nestjs
	docker rmi skys-dynamodb

clean-core:
	docker rmi skys-core:nodejs

clean-api:
	docker rmi skys-api:nestjs

clean-scraper:
	docker rmi skys-scraper:puppeteer-with-nestjs

clean-db:
	docker rmi skys-dynamodb

##
# apply
#
install-all:
	helm install skys-core-app core/node --debug --set container.volume.project_root_path=${SKYS_CORE_ROOT_PATH}
	helm install skys-api-app api/node --debug --set container.volume.project_root_path=${SKYS_API_ROOT_PATH}
	helm install skys-dynamodb db/dynamodb --debug
	helm install skys-scraper-app scraper/node --debug --set container.volume.project_root_path=${SKYS_SCRAPER_ROOT_PATH},container.pm2io.public_key=${PM2_PUBLIC_KEY},container.pm2io.secret_key=${PM2_SECRET_KEY}

install-core:
	helm install skys-core-app core/node --debug --set container.volume.project_root_path=${SKYS_CORE_ROOT_PATH}

install-api:
	helm install skys-api-app api/node --debug --set container.volume.project_root_path=${SKYS_API_ROOT_PATH}

install-scraper:
	helm install skys-scraper-app scraper/node --debug --set container.volume.project_root_path=${SKYS_SCRAPER_ROOT_PATH},container.pm2io.public_key=${PM2_PUBLIC_KEY},container.pm2io.secret_key=${PM2_SECRET_KEY}

install-db:
	helm install skys-dynamodb db/dynamodb --debug

##
# delete
#
uninstall-all:
	helm uninstall skys-core-app
	helm uninstall skys-api-app
	helm uninstall skys-scraper-app
	helm uninstall skys-dynamodb

uninstall-core:
	helm uninstall skys-core-app

uninstall-api:
	helm uninstall skys-api-app

uninstall-scraper:
	helm uninstall skys-scraper-app

uninstall-db:
	helm uninstall skys-dynamodb
