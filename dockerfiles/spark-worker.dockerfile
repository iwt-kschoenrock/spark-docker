FROM apache/spark-py:v3.1.3

ENV MASTER_CONTAINER_NAME=spark-master
ENV CORES=1
ENV MEMORY=1G
ENV SPARK_WORKER_WEBUI_PORT 8082
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_WORKER_PORT=35001


EXPOSE 8082 35001

#ENTRYPOINT $SPARK_HOME/bin/spark-class org.apache.spark.deploy.worker.Worker -d $SPARK_HOME/work-dir -c $CORES -m $MEMORY spark://$MASTER_CONTAINER_NAME:7077
ENTRYPOINT $SPARK_HOME/bin/spark-class org.apache.spark.deploy.worker.Worker -d $SPARK_HOME/work-dir spark://$MASTER_CONTAINER_NAME:7077
