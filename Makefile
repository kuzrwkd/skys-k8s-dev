#!make
include envfile

##
# clean
#
clean-localstack:
	docker rmi localstack/localstack

##
# add repository
#
add-repository-localstack:
	helm repo add localstack-charts https://localstack.github.io/helm-charts

##
# remove repository
#
remove-repository-localstack:
	helm repo remove localstack-charts

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

install-elasticsearch:
	helm install skys-elasticsearch elasticsearch/node --debug --set container.volume.project_root_path=${SKYS_ELASTICSEARCH_ROOT_PATH},container.env.elastic_password=${SKYS_ELASTIC_PASSWORD}

install-kibana:
	helm install skys-kibana kibana/node --debug --set container.volume.project_root_path=${SKYS_ELASTICSEARCH_ROOT_PATH}

install-localstack:
	helm install localstack localstack-charts/localstack \
		--version 0.6.8 \
		--debug \
		--set debug=true \
		--set service.edgeService.nodePort=30100 \
		--set mountDind.enabled=true \
		--wait

install-cdk:
	helm install skys-cdk cdk/node --debug --set container.volume.project_root_path=${SKYS_CDK_ROOT_PATH}

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

uninstall-elasticsearch:
	helm uninstall skys-elasticsearch

uninstall-kibana:
	helm uninstall skys-kibana

uninstall-localstack:
	helm delete localstack

uninstall-cdk:
	helm uninstall skys-cdk
