# Running Apache Spark locally with Docker

Following the instructions in [this article](https://towardsdatascience.com/diy-apache-spark-docker-bb4f11c10d24).

The objective is to run a spark (cluster) locally with Docker/Podman.

## Important Details

- the installed version of Spark must be the same for all 
parts (driver, worker, and application)


## Useful links:

- https://www.cloudassembler.com/post/remote-podman-service/
- https://hub.docker.com/r/apache/spark-py
- https://docs.microsoft.com/en-us/azure/hdinsight/spark/apache-spark-jupyter-notebook-install-locally
- https://dev.to/thangchung/start-podman-on-wsl2-in-4-steps-3jn9
- https://livebook.manning.com/book/spark-in-action/chapter-11/67
- https://spark.apache.org/docs/latest/sql-getting-started.html
- https://databricks.com/de/blog/2016/08/15/how-to-use-sparksession-in-apache-spark-2-0.html
- https://maelfabien.github.io/bigdata/SparkInstall/#

Bonus: running Podman under WSL 2 (Windows 10/11):
- [Using SSH in WSL: allow password login](https://stackoverflow.com/a/65197283)
- [configure firewall and port forwarding (with script)](https://gist.github.com/estsaon/b27452c3ba105c369a5d7c9b1f10c6e7)
- see the scripts under [wsl](wsl) as well