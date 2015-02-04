package edu.uv.dynamicresponse;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.net.Socket;
import java.util.HashMap;

import edu.uv.common.UtilsHTTP;

public class SingleBuilder {
		 
	 private static HashMap<String,SingleBuilder> clases=new HashMap<String,SingleBuilder>();	 
	 
	 private SingleBuilder(){}
		 	 
	 private SingleBuilder(Socket canal, String clase, String request){
			try {
				Class<?> c = Class.forName(clase);
				Constructor<?> con = c.getConstructor(new Class<?>[] {});
				ResponseClass rc = (ResponseClass) con.newInstance(new Object[] {});
				rc.setMethod(UtilsHTTP.getMethod(request));
				rc.setResource(UtilsHTTP.getResource(request));
				rc.setSocket(canal);
				rc.dealWithCall();
				canal.close();
				rc = null;
			} catch (Exception ex) {
				ex.printStackTrace();
				try {
					UtilsHTTP.writeResponseServerError(new PrintWriter(canal.getOutputStream()));
				} catch (Exception ex2) {
				}
			}		 
	 }
	 
	 public static SingleBuilder createInstance(Socket canal, String clase, String request) {
		 
		 if (clases.get(clase)==null){			 
			 System.out.println("NO tenemos la clase declarada la hacemos");
			 if (clases.get(clase) == null) {		            
		            synchronized(SingleBuilder.class) {
		                if (clases.get(clase) == null) { 
		                	clases.put(clase,new SingleBuilder());		                	
		                }
		            }
		        }			 			 
		 }
		 return clases.get(clase);
	 }
		
}
