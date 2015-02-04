import java.io.FileInputStream;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import edu.uv.cgiresponse.*;
import edu.uv.common.*;
import edu.uv.dynamicresponse.*;
import edu.uv.staticresponse.*;

public class Server {
	public static void main(String[] args) throws Exception {

		// Default values
		// Default path of the resources
		String path = "/var/web/";
		// Default prefix for restricted access
		String priv = "private";
		// Name of the file with user/pass
		String accessFile = ".access";
		// Maximum number of concurrent clients
		int nThreads = 50;
		// Server port
		int port = 8080;
		// File with cgi mappings
		String cgiMappingsFile = "cgi_mappings.txt";
		// File with dynamic mappings
		String dynamicMappingsFile = "dynamic_mappings.txt";

		try {
			Properties p = new Properties();
			p.load(new FileInputStream("config.ini"));
			path = p.getProperty("PATH", "/var/web/");
			priv = p.getProperty("AUTH_PREFIX", "private");
			accessFile = p.getProperty("ACCESS_FILE", ".access");
			nThreads = Integer.parseInt(p.getProperty("NUM_THREADS", "50"));
			port = Integer.parseInt(p.getProperty("SERVER_PORT", "8080"));
			cgiMappingsFile = p.getProperty("CGI_MAPPINGS_FILE",
					"cgi_mappings.txt");
			dynamicMappingsFile = p.getProperty("DYNAMIC_MAPPINGS_FILE",
					"dynamic_mappings.txt");

			p = null;
		} catch (Exception ex) {
			System.out
					.println("You can provide a config.ini file to configure the server.");
			System.out.println("PATH=path");
			System.out.println("AUTH_PREFIX=prefix");
			System.out.println("ACCESS_FILE=file");
			System.out
					.println("NUM_THREADS=maximum numer of concurrent threads");
			System.out.println("SERVER_PORT=port");
			System.out.println("CGI_MAPPINGS_FILE=file");
			System.out.println("DYNAMIC_MAPPINGS_FILE=file");
		}

		System.out.println("Configuration values are:");
		System.out.println("Resource location: " + path);
		System.out
				.println("Resources that require user and password are located "
						+ "in a directory that starts with : " + priv);
		System.out.println("Default file with user;pass : " + accessFile);
		System.out.println("Maximum number of concurrent requests attended: "
				+ nThreads);
		System.out.println("Default server port :" + port);
		System.out.println("CGI mappings file :" + cgiMappingsFile);
		System.out.println("DYNAMIC mappings file :" + dynamicMappingsFile);

		ServerSocket s = new ServerSocket(port);

		ExecutorService ex = Executors.newFixedThreadPool(nThreads);

		HashMap<String, ProcessAndArgsOrder> mapsCGI;

		HashMap<String, JarAndClass> mapsDynamic;
			

		while (true) {
			
			// To allow changes in the cgi mappings in runtime
			mapsCGI = UtilsCGI.getCGIMappings(cgiMappingsFile);

			// To allow changes in the dynamic mappings in runtime
			mapsDynamic = UtilsDynamic.getDynamicMappings();
			
			// Add all the jars in mapsDynamic to the classpath
			if (mapsDynamic.size()>0)
			   JarPathUtils.addJarsToClassPath(UtilsDynamic.getJars(mapsDynamic));
			
			Socket canal = s.accept();

			System.out.println("---- New request from : "
					+ canal.getInetAddress().toString());

			InputStream in = canal.getInputStream();

			String request = UtilsHTTP.readLine(in);

			System.out.println("------- " + request);

			String rec = UtilsHTTP.getResource(request);

			ProcessAndArgsOrder p = null;

			boolean done = false;

			if (mapsCGI.size() > 0) {
				// Search if the requested resource starts with the URL defined
				// in the CGI mappings file
				Set<String> sm = mapsCGI.keySet();
				for (String m : sm)
					if (rec.startsWith(m))
						p = mapsCGI.get(m);

				if (p != null) {
					// Dinamico CGI
					System.out.println("--------CGI");
					ex.execute(new ThreadCGI(canal, p, request));
					done = true;
				}
			}
			if (!done) {
				// Dynamic (code is in a class)
				Set<String> smd = mapsDynamic.keySet();
				for (String m : smd) {
					if (rec.startsWith(m)) {
						System.out.println("---------DYNAMIC");
						ex.execute(new ThreadDynamic(canal, mapsDynamic.get(m).getClassFile(),
								request));
						done = true;
					}
				}
			} 
            if (!done) {
				// Estatico
				System.out.println("----------STATIC");
				ex.execute(new ThreadStatic(canal, path, priv, accessFile,
						request));
			}
		}
	}
}
