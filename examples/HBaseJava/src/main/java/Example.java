import static java.util.concurrent.TimeUnit.SECONDS;

import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.apache.hadoop.gateway.shell.BasicResponse;
import org.apache.hadoop.gateway.shell.Hadoop;
import org.apache.hadoop.gateway.shell.hbase.ClusterVersion;
import org.apache.hadoop.gateway.shell.hbase.HBase;
import org.apache.hadoop.gateway.shell.hbase.Status;
import org.apache.hadoop.gateway.shell.hbase.SystemVersion;

public class Example {
		
   public static void main(String[] args) throws Exception {
    
	   Map<String, String> env = System.getenv();
	   
	   Hadoop session = Hadoop.login( env.get("gateway"), env.get("username"), env.get("password") );
				
	   Future<SystemVersion.Response> systemVersionFuture = HBase.session(session).systemVersion().later();
	   Future<ClusterVersion.Response> clusterVersionFuture = HBase.session(session).clusterVersion().later();
	   Future<Status.Response> clusterStatusFuture = HBase.session(session).status().later();
	  
	   // for some reason gradle was not detecting when I returned 
	   // the exception so instead return with System.exit
	   try {
		   
		   // execute the three requests in parallel
	       session.waitFor(
	                   60, SECONDS,
	                   systemVersionFuture,
	                   clusterVersionFuture,
	                   clusterStatusFuture
	                   );
	   } catch (Exception e) {
		   e.printStackTrace();
	       System.exit(1);
	   }

	   verifyFuture(systemVersionFuture);
	   verifyFuture(clusterVersionFuture);
	   verifyFuture(clusterStatusFuture);
	   
       session.shutdown();
   }
   
   public static void verifyFuture(Future<?> future) throws InterruptedException, ExecutionException {
	   @SuppressWarnings("unchecked")
	   Future<BasicResponse> f = (Future<BasicResponse>)future;
	   
	    if (f.get().getStatusCode() != 200) {
	        System.err.println("**** Received HTTP ${future.get().statusCode} from API");
	        System.exit(1);
	    }
	    System.out.println(future.get().toString());
   }
}
