help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

SPARK_TAG?=latest

SPARK_NAMESPACE:=kas/spark
SPARK_DOCKER_NETWORK:=spark-net-bridge

docker-spark-master:  ## build the docker image for spark master nodes
	docker build -f dockerfiles/spark-master.dockerfile -t ${SPARK_NAMESPACE}/master:${SPARK_TAG} .

spark-master: docker-spark-master  ## run the spark master node with docker
	docker run --rm -it -p 8080:8080 -p 7077:7077 --name spark-master --network ${SPARK_DOCKER_NETWORK} ${SPARK_NAMESPACE}/master:${SPARK_TAG}

docker-spark-worker: ## build the docker image for spark worker nodes
	docker build -f dockerfiles/spark-worker.dockerfile -t ${SPARK_NAMESPACE}/worker:${SPARK_TAG} .

spark-worker1: docker-spark-worker ## run spark worker node 1 with docker
	docker run --rm -it -p 8081:8081 -p 35001:35001 --network ${SPARK_DOCKER_NETWORK} ${SPARK_NAMESPACE}/worker:${SPARK_TAG}

docker-spark-create-bridge: ## create the docker network for the spark containers
	docker network create --driver bridge ${SPARK_DOCKER_NETWORK}
