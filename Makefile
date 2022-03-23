SPARK_TAG?=1

SPARK_NAMESPACE:=kas/spark
SPARK_DOCKER_NETWORK:=spark-net-bridge

docker-spark-master:
	docker build -f dockerfiles/spark-master.dockerfile -t ${SPARK_NAMESPACE}/master:${SPARK_TAG} .

spark-master: docker-spark-master
	docker run --rm -it -p 8080:8080 -p 7077:7077 --name spark-master --network ${SPARK_DOCKER_NETWORK} ${SPARK_NAMESPACE}/master:${SPARK_TAG}

docker-spark-worker:
	docker build -f dockerfiles/spark-worker.dockerfile -t ${SPARK_NAMESPACE}/worker:${SPARK_TAG} .

spark-worker1: docker-spark-worker
	docker run --rm -it -p 8081:8081 -p 35001:35001 --network ${SPARK_DOCKER_NETWORK} ${SPARK_NAMESPACE}/worker:${SPARK_TAG}

docker-spark-create-bridge:
	docker network create --driver bridge ${SPARK_DOCKER_NETWORK}
