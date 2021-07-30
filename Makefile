#!make
include envfile

##
# build
#
build-all:
	docker build --no-cache -t skys-client:nextjs client/node/docker
	docker build --no-cache -t skys-api:mysql8.0 api/mysql/docker
	docker build --no-cache -t skys-api:nestjs api/node/docker
	docker build --no-cache -t skys-scraper:mysql8.0 scraper/mysql/docker
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs scraper/node/docker

build-client:
	docker build --no-cache -t skys-client:nextjs client/node/docker

build-api:
	docker build --no-cache -t skys-api:mysql8.0 api/mysql/docker
	docker build --no-cache -t skys-api:nestjs api/node/docker

build-scraper:
	docker build --no-cache -t skys-scraper:mysql8.0 scraper/mysql/docker
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs scraper/node/docker

##
# clean
#
clean-all:
	docker rmi skys-client:nextjs
	docker rmi skys-api:nestjs
	docker rmi skys-api:mysql8.0
	docker rmi skys-scraper:puppeteer-with-nestjs
	docker rmi skys-scraper:mysql8.0

clean-client:
	docker rmi skys-client:nextjs

clean-api:
	docker rmi skys-api:nestjs
	docker rmi skys-api:mysql8.0

clean-scraper:
	docker rmi skys-scraper:puppeteer-with-nestjs
	docker rmi skys-scraper:mysql8.0

##
# apply
#
install-all:
	helm install skys-client-app client/node --debug --set container.volume.project_root_path=${SKYS_CLIENT_ROOT_PATH}
	helm install skys-api-db api/mysql --debug
	helm install skys-api-app api/node --debug --set container.volume.project_root_path=${SKYS_API_ROOT_PATH}
	helm install skys-scraper-db scraper/mysql --debug
	helm install skys-scraper-app scraper/node --debug --set container.volume.project_root_path=${SKYS_SCRAPER_ROOT_PATH}


install-client:
	helm install skys-client-app client/node --debug --set container.volume.project_root_path=${SKYS_CLIENT_ROOT_PATH}

install-api:
	helm install skys-api-db api/mysql --debug
	helm install skys-api-app api/node --debug --set container.volume.project_root_path=${SKYS_API_ROOT_PATH}

install-scraper:
	helm install skys-scraper-db scraper/mysql --debug
	helm install skys-scraper-app scraper/node --debug --set container.volume.project_root_path=${SKYS_SCRAPER_ROOT_PATH}

##
# delete
#
uninstall-all:
	helm uninstall skys-client-app
	helm uninstall skys-api-db skys-api-app
	helm uninstall skys-scraper-db skys-scraper-app

uninstall-client:
	helm uninstall skys-client-app

uninstall-api:
	helm uninstall skys-api-db skys-api-app

uninstall-scraper:
	helm uninstall skys-scraper-db skys-scraper-app