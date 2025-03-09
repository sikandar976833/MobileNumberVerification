
package com.otp.mobileservlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import org.apache.log4j.Logger;



public class api {
     static Logger log=Logger.getLogger(api.class);
    private static final String API_KEY = "CA0CB5EA0DDA4762BAA083ACAFA0865F";
    
     static String  callapi(String mobileno) throws MalformedURLException
    {
    
      String apiUrl = "https://api.veriphone.io/v2/verify?phone=" + mobileno + "&key=" + API_KEY;
      log.info("Apiurl "+ apiUrl);
     
       String finalresponse="";
        try {
             URL obj=new URL(apiUrl);
      
            HttpURLConnection conn=(HttpURLConnection) obj.openConnection();
            conn.setRequestMethod("GET");
            
            BufferedReader in= new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
           String inputLine;
           StringBuffer response=new StringBuffer();
            
            while((inputLine=in.readLine())!=null)
            {
                response.append(inputLine);
            }
            finalresponse=response.toString();
            log.info("response : "+response);
        } catch (ProtocolException ex) {
           log.error("Error "+ ex);
        } catch (IOException ex) {
             log.error("Error "+ ex);
        }

      return finalresponse;
      
      
    }
    
    
    
    
}
