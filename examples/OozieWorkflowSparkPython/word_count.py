from __future__ import print_function

import sys
from operator import add

from pyspark import SparkContext


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: wordcount <input_file> <output_file>", file=sys.stderr)
        exit(-1)

    input_file = sys.argv[1];
    output_file = sys.argv[2];

    spark = SparkContext(appName="PythonWordCount")

    text_file = spark.textFile("hdfs://" + input_file)
    counts = text_file.flatMap(lambda line: line.split(" ")) \
                 .map(lambda word: (word, 1)) \
                 .reduceByKey(lambda a, b: a + b)

    counts.saveAsTextFile("hdfs://" + output_file) 
