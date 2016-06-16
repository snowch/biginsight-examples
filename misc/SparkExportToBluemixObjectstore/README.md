Login to Bluemix and set the region.

![Bluemix Region](./docs/bluemix_region.png)

Now click on Catalog and search for spark and click on the Spark icon.

![Catalog Spark](./docs/catalog_spark.png)

Click create for a Spark personal instance.

![Spark Personal](./docs/spark_personal.png)

Click on Notebook.

![Spark Notebook](./docs/spark_notebook.png)

Click on Object Storage.

![Object Storage](./docs/spark_add_objectstorage.png)

Click on Object Storage.

![Object Storage](./docs/spark_add_objectstorage.png)
 
Create new Object Storage or select existing.  Select Service Credentials.

![Object Storage Credentials](./docs/spark_objectstore_creds.png)

Download the exporttoswift.sh file.  

Enter your BigInsights username and hostname.

Enter the credentials from Object Storage Service Credentials Screen.

Download the exporttoswift.py file and LICENSE file.

Run `bash ./exporttoswift.sh`.

If you have no errors, verify that you have a new Object Store container in bluemix with the wordcounts.

![Data in Swift](./docs/spark_data_in_swift.png)

Next open a notebook that has the Object Storage attached, and perform the following (replacing for your container name):

```
data = sc.textFile("swift://1466091594.spark/counts/")
```

![Read Data](./docs/spark_swift_output.png)

When you have successfully executed `bash ./exporttoswift.sh`, try `bash ./exporttoswiftlarge.sh` which uses a much bigger dataset.
