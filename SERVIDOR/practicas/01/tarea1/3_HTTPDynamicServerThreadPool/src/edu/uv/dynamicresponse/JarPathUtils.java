package edu.uv.dynamicresponse;

import java.io.File;
import java.io.IOException;
import java.net.URLClassLoader;
import java.net.URL;
import java.util.List;
import java.lang.reflect.Method;

/**
 * This code is adapted from
 * http://stackoverflow.com/questions/1010919/adding-files
 * -to-java-classpath-at-runtime
 * 
 */
public class JarPathUtils {

	private static final Class<?>[] parameters = new Class[] { URL.class };

	private static boolean doesJarExist(String jarName) throws IOException{
	    ClassLoader classLoader = ClassLoader.getSystemClassLoader();
	    if (classLoader instanceof URLClassLoader)
	    {

	        URL [] urls = ((URLClassLoader) classLoader).getURLs();

	        for (URL url : urls)
	        {
	            File file = new File(url.getFile());
	            if (file.getPath().endsWith(jarName))
	            {	           
	                return true;
	            }
	        }
	        
	        
	    }
	    return false;
	}
	
	
	private static void addJar(String path) throws IOException {
		URL u = new URL("file://" + path);

		URLClassLoader sysloader = (URLClassLoader) ClassLoader
				.getSystemClassLoader();
		Class<?> sysclass = URLClassLoader.class;

		try {
			Method method = sysclass.getDeclaredMethod("addURL", parameters);
			method.setAccessible(true);
			method.invoke(sysloader, new Object[] { u });
		} catch (Throwable t) {
			t.printStackTrace();
			throw new IOException(
					"Error, could not add URL to system classloader");
		}// end try catch

	}// end method
	
	public static void addJarsToClassPath(List<String> jars){
		for (String j:jars){
			try{
			   if (!doesJarExist(j))
				   addJar(j);
			}catch(IOException ex){
				System.out.println("There has been a problem adding " + j + " to classpath");
			}
		}
	}
	

}// end class

