FROM apache/spark-py:v3.1.3

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV CORES=1
ENV MEMORY=1G
ENV SPARK_MASTER_LOG /spark/logs

EXPOSE 8080 7077

#ENTRYPOINT $SPARK_HOME/bin/spark-class -c $CORES -m $MEMORY org.apache.spark.deploy.master.Master
ENTRYPOINT $SPARK_HOME/bin/spark-class org.apache.spark.deploy.master.Master
