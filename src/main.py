from pyspark.sql import SparkSession
from pyspark.sql.functions import desc

if __name__ == '__main__':
    spark = SparkSession \
        .builder \
        .appName("Python Spark SQL basic example") \
        .config("spark.shuffle.service.enabled", False) \
        .config("spark.dynamicAllocation.enabled", False) \
        .config("spark.logConf", "true") \
        .master("spark://192.168.178.44:7077") \
        .getOrCreate()
    # spark.sparkContext.setLogLevel('DEBUG')
    # numDS = spark.range(5, 100, 5)
    # # reverse the order and display first 5 items
    # numDS.orderBy(desc("id")).show(5)
    # # compute descriptive stats and display them
    # numDS.describe().show()
    # #  create a DataFrame using spark.createDataFrame from a List or Seq
    # langPercentDF = spark.createDataFrame([("Scala", 35), ("Python", 30), ("R", 15), ("Java", 20)])
    # # rename the columns
    # lpDF = langPercentDF.withColumnRenamed("_1", "language").withColumnRenamed("_2", "percent")
    # # order the DataFrame in descending order of percentage
    # lpDF.orderBy(desc("percent")).show()
    df = spark.createDataFrame(
        [
            (1, "foo"),  # create your data here, be consistent in the types.
            (2, "bar"),
        ],
        ["id", "label"]  # add your column names here
    )

    df.printSchema()
    df.show()
