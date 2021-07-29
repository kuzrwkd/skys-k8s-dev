##
# build
#
build-all:
	docker build --no-cache -t skys-client:nextjs k8s/client/node/docker
	docker build --no-cache -t skys-api:mysql8.0 k8s/api/mysql/docker
	docker build --no-cache -t skys-api:nestjs k8s/api/node/docker
	docker build --no-cache -t skys-scraper:mysql8.0 k8s/scraper/mysql/docker
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs k8s/scraper/node/docker

build-client:
	docker build --no-cache -t skys-client:nextjs k8s/client/node/docker

build-api:
	docker build --no-cache -t skys-api:mysql8.0 k8s/api/mysql/docker
	docker build --no-cache -t skys-api:nestjs k8s/api/node/docker

build-scraper:
	docker build --no-cache -t skys-scraper:mysql8.0 k8s/scraper/mysql/docker
	docker build --no-cache -t skys-scraper:puppeteer-with-nestjs k8s/scraper/node/docker

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
apply-all:
	kubectl apply -f k8s/client/node/pod.yml
	kubectl apply -f k8s/client/node/service.yml
	kubectl apply -f k8s/api/mysql/configMap.yml
	kubectl apply -f k8s/api/mysql/deployment.yml
	kubectl apply -f k8s/api/mysql/service.yml
	kubectl apply -f k8s/api/node/pod.yml
	kubectl apply -f k8s/api/node/service.yml
	kubectl apply -f k8s/scraper/mysql/configMap.yml
	kubectl apply -f k8s/scraper/mysql/deployment.yml
	kubectl apply -f k8s/scraper/mysql/service.yml
	kubectl apply -f k8s/scraper/node/pod.yml
	kubectl apply -f k8s/scraper/node/service.yml

apply-client:
	kubectl apply -f k8s/client/node/pod.yml
	kubectl apply -f k8s/client/node/service.yml

apply-api:
	kubectl apply -f k8s/api/mysql/configMap.yml
	kubectl apply -f k8s/api/mysql/deployment.yml
	kubectl apply -f k8s/api/mysql/service.yml
	kubectl apply -f k8s/api/node/pod.yml
	kubectl apply -f k8s/api/node/service.yml

apply-scraper:
	kubectl apply -f k8s/scraper/mysql/configMap.yml
	kubectl apply -f k8s/scraper/mysql/deployment.yml
	kubectl apply -f k8s/scraper/mysql/service.yml
	kubectl apply -f k8s/scraper/node/pod.yml
	kubectl apply -f k8s/scraper/node/service.yml

##
# delete
#
delete-all:
	kubectl delete -f k8s/client/node/pod.yml
	kubectl delete -f k8s/client/node/service.yml
	kubectl delete -f k8s/api/mysql/configMap.yml
	kubectl delete -f k8s/api/mysql/deployment.yml
	kubectl delete -f k8s/api/mysql/service.yml
	kubectl delete -f k8s/api/node/pod.yml
	kubectl delete -f k8s/api/node/service.yml
	kubectl delete -f k8s/scraper/mysql/configMap.yml
	kubectl delete -f k8s/scraper/mysql/deployment.yml
	kubectl delete -f k8s/scraper/mysql/service.yml
	kubectl delete -f k8s/scraper/node/pod.yml
	kubectl delete -f k8s/scraper/node/service.yml

delete-client:
	kubectl delete -f k8s/client/node/pod.yml
	kubectl delete -f k8s/client/node/service.yml

delete-api:
	kubectl delete -f k8s/api/mysql/configMap.yml
	kubectl delete -f k8s/api/mysql/deployment.yml
	kubectl delete -f k8s/api/mysql/service.yml
	kubectl delete -f k8s/api/node/pod.yml
	kubectl delete -f k8s/api/node/service.yml

delete-scraper:
	kubectl delete -f k8s/scraper/mysql/configMap.yml
	kubectl delete -f k8s/scraper/mysql/deployment.yml
	kubectl delete -f k8s/scraper/mysql/service.yml
	kubectl delete -f k8s/scraper/node/pod.yml
	kubectl delete -f k8s/scraper/node/service.yml