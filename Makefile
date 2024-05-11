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
# Install custom resource
#
install-eck-custom-resource:
	kubectl apply -f https://download.elastic.co/downloads/eck/2.12.1/crds.yaml

##
# uninstall custom resource
#
uninstall-eck-custom-resource:
	kubectl delete -f https://download.elastic.co/downloads/eck/2.12.1/crds.yaml

##
# install operator
#
install-eck-operator:
	kubectl apply -f https://download.elastic.co/downloads/eck/2.12.1/operator.yaml

##
# uninstall operator
#
uninstall-eck-operator:
	kubectl delete -f https://download.elastic.co/downloads/eck/2.12.1/operator.yaml

##
# apply
#
install-core:
	helm install skys-core core/node \
		--debug \
		--set container.volume.project_root_path=${SKYS_CORE_ROOT_PATH}

install-cli:
	helm install skys-cli cli/node \
		--debug \
		--set container.volume.project_root_path=${SKYS_CLI_ROOT_PATH}

install-api:
	helm install skys-api api/node \
		--debug \
		--set container.volume.project_root_path=${SKYS_API_ROOT_PATH} \
		--set env.elasticsearch_password=${ELASTIC_SEARCH_PASSWORD}

install-scraper:
	helm install skys-scraper scraper/node \
		--debug \
		--set container.volume.project_root_path=${SKYS_SCRAPER_ROOT_PATH}

install-elasticsearch:
	helm install skys-elasticsearch elasticsearch/node \
		--debug

install-kibana:
	helm install skys-kibana kibana/node \
		--debug

install-localstack:
	helm install localstack localstack-charts/localstack -f localstack/pro-values.yaml \
		--version 0.6.12 \
		--debug \
		--set extraEnvVars[0].name=LOCALSTACK_AUTH_TOKEN \
		--set extraEnvVars[0].value=${LOCALSTACK_AUTH_TOKEN} \
		--wait

install-cdk:
	helm install skys-cdk cdk/node \
		--debug \
		--set container.volume.project_root_path=${SKYS_CDK_ROOT_PATH} \
		--set env.elasticsearch_password=${ELASTIC_SEARCH_PASSWORD}

##
# delete
#
uninstall-core:
	helm uninstall skys-core

uninstall-cli:
	helm uninstall skys-cli

uninstall-api:
	helm uninstall skys-api

uninstall-scraper:
	helm uninstall skys-scraper

uninstall-elasticsearch:
	helm uninstall skys-elasticsearch

uninstall-kibana:
	helm uninstall skys-kibana

uninstall-localstack:
	helm delete localstack

uninstall-cdk:
	helm uninstall skys-cdk
