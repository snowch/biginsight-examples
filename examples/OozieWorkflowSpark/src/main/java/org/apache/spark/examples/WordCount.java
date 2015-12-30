/**
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */


package org.apache.spark.examples;

import java.util.ArrayList;
import java.util.List;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.FlatMapFunction;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.api.java.function.Function2;
import org.apache.spark.api.java.function.PairFunction;

import scala.Tuple2;

public class WordCount {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.err.println("Usage: WordCountSparkMain <file> <file>");
            System.exit(1);
        }
        String inputPath = args[0];
        String outputPath = args[1];
        SparkConf sparkConf = new SparkConf().setAppName("Word count");
        try (JavaSparkContext ctx = new JavaSparkContext(sparkConf)) {
            JavaRDD<String> lines = ctx.textFile(inputPath, 1);
            JavaRDD<String> words = lines.flatMap(new FlatMapFunction<String, String>() {
                private static final long serialVersionUID = 1L;
                public Iterable<String> call(String sentence) {
                    List<String> result = new ArrayList<>();
                    if (sentence != null) {
                        String[] words = sentence.split(" ");
                        for (String word : words) {
                            if (word != null && word.trim().length() > 0) {
                                result.add(word.trim().toLowerCase());
                            }
                        }
                    }
                    return result;
                }
            });
            JavaPairRDD<String, Integer> pairs = words.mapToPair(new PairFunction<String, String, Integer>() {
                private static final long serialVersionUID = 1L;
                public Tuple2<String, Integer> call(String s) {
                    return new Tuple2<>(s, 1);
                }
            });
 
            JavaPairRDD<String, Integer> counts = pairs.reduceByKey(new Function2<Integer, Integer, Integer>() {
                private static final long serialVersionUID = 1L;
                public Integer call(Integer a, Integer b) {
                    return a + b;
                }
            }, 2);
            JavaPairRDD<Integer, String> countsAfterSwap = counts.mapToPair(new PairFunction<Tuple2<String, Integer>, Integer, String>() {
                private static final long serialVersionUID = 2267107270683328434L;
                @Override
                public Tuple2<Integer, String> call(Tuple2<String, Integer> t)
                        throws Exception {
                    return new Tuple2<>(t._2, t._1);
                }
            });
            countsAfterSwap = countsAfterSwap.sortByKey(false);
            counts = countsAfterSwap.mapToPair(new PairFunction<Tuple2<Integer, String>, String, Integer>() {
                private static final long serialVersionUID = 2267107270683328434L;
                @Override
                public Tuple2<String, Integer> call(Tuple2<Integer, String> t)
                        throws Exception {
                    return new Tuple2<>(t._2, t._1);
                }
            });
            JavaRDD<String> results = counts.map(new Function<Tuple2<String, Integer>, String>() {
                @Override
                public String call(Tuple2<String, Integer> v1) throws Exception {
                    return String.format("%s,%s", v1._1, Integer.toString(v1._2));
                }
            });
            results.saveAsTextFile(outputPath);
        }
    }
}