package edu.uv.cgiresponse;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

/**
 * This class offers some helper static methods to execute a process and to
 * obtain the mappings from URL to a process from a file
 * 
 * @author Juan Gutierrez Aguado (Dep. Informatica, Univ. Valencia, Spain)
 */
public class UtilsCGI {
	/**
	 * Execute a process a writes its output to an OutputStream
	 * 
	 * @param the
	 *            output of the process will be send to this output stream
	 * @param command
	 *            "program arg1 arg2 ... argN" as a List<String>
	 * @throws Exception
	 */
	public static void callProcess(OutputStream out, List<String> command)
			throws Exception {
		// Allows to execute a command with arguments
		ProcessBuilder pb = new ProcessBuilder(command);
		Process p = pb.start();

		// This will allow to read from the output of the process
		InputStream in = p.getInputStream();

		int dato = 0;
		while ((dato = in.read()) != -1)
			out.write(dato);
		in.close();
		out.close();
	}

	/**
	 * Reads a file with lines of tokens: URL;program and returns a HashMap
	 * 
	 * @param cgiMapFile
	 *            the full name of the file with the mappings
	 * @return the mappings in the file as a HashMap
	 */
	public static HashMap<String, ProcessAndArgsOrder> getCGIMappings(
			String cgiMapFile) {
		HashMap<String, ProcessAndArgsOrder> maps = new HashMap<String, ProcessAndArgsOrder>();
		try {
			BufferedReader br = new BufferedReader(new FileReader(cgiMapFile));
			String cad;
			while ((cad = br.readLine()) != null) {
				StringTokenizer st = new StringTokenizer(cad, ";");
				String url = st.nextToken();
				String pa = st.nextToken();

				ProcessAndArgsOrder pao = new ProcessAndArgsOrder();
				StringTokenizer stpa = new StringTokenizer(pa, " ");
				pao.setProcess(stpa.nextToken());
				while (stpa.hasMoreTokens())
					pao.addArgument(stpa.nextToken());

				maps.put(url, pao);
			}
			br.close();
		} catch (Exception ex) {

		}
		return maps;
	}
}
