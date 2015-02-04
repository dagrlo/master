package edu.uv.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Set;
import java.util.StringTokenizer;

import javax.xml.bind.DatatypeConverter;

/**
 * This class offers some helper static methods that can be used to read the
 * request and to write the response in an HTTP server
 * 
 * @author Juan Gutierrez Aguado (Dep. Informatica, Univ. Valencia, Spain)
 */
public class UtilsHTTP {

	/**
	 * This method returns the value of the Content-Length Header
	 * 
	 * @param cab
	 * @return
	 */
	private static int getContentLength(HashMap<String, String> cab) {
		int lon = -1;
		String tam = cab.get("Content-Length");
		if (tam != null)
			lon = Integer.parseInt(tam.trim());
		return lon;
	}

	/**
	 * 
	 * @param cab
	 * @param in
	 * @return
	 */
	public static byte[] getBody(HashMap<String, String> cab, InputStream in) {
		int tam = getContentLength(cab);
		byte[] body = null;

		if (tam != -1) {

			body = new byte[tam];
			try {
				in.read(body, 0, tam);
			} catch (Exception ex) {
				System.out.println(ex.toString());
			}
		}
		return body;
	}

	/**
	 * This method extracts the parameters from the request body of a POST
	 * message
	 * 
	 * @param body
	 *            the body of the request
	 * @return a HashMap with <param,value>
	 */
	public static HashMap<String, String> parseBody(byte[] body) {
		String s = new String(body);
		// System.out.println(s);
		HashMap<String, String> params = new HashMap<String, String>();
		String[] result = s.split("&");
		for (int x = 0; x < result.length; x++) {
			String[] par = result[x].split("=");
			params.put(par[0], par[1]);
		}
		// System.out.println(params);
		return params;
	}

	/**
	 * This method extracts the parameters from the URL of a GET message
	 * 
	 * @param s
	 * @return
	 */
	public static HashMap<String, String> getParamsGet(String s) {
		HashMap<String, String> params = new HashMap<String, String>();

		try {
			String[] result = s.split("\\?");
			String p = result[1];
			String[] pairs = p.split("\\&");

			for (int x = 0; x < pairs.length; x++) {
				String[] par = pairs[x].split("=");
				params.put(par[0], par[1]);
			}
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return params;
	}

	/**
	 * This method reads a line. The line ends with a \r\n
	 * 
	 * @param in
	 *            the stream
	 * @return the line
	 * @throws IOException
	 */
	public static String readLine(InputStream in) throws IOException {
		int b;
		int estado = 0;
		StringBuffer sb = new StringBuffer();
		while ((estado < 2) && ((b = in.read()) != -1)) {
			char c = (char) b;
			if ((c == '\r') && (estado == 0))
				estado = 1;
			if ((c == '\n') && (estado == 1))
				estado = 2;
			if (estado == 0)
				sb.append(c);
		}
		return sb.toString();

	}

	/**
	 * This method returns the request type
	 * 
	 * @param linea
	 *            the first line in the request
	 * @return the type of the request
	 */
	public static String getMethod(String linea) {
		String method = null;
		if (linea.startsWith("GET"))
			method = "GET";
		else if (linea.startsWith("POST"))
			method = "POST";
		else if (linea.startsWith("PUT"))
			method = "PUT";
		else if (linea.startsWith("HEAD"))
			method = "HEAD";
		else if (linea.startsWith("DELETE"))
			method = "DELETE";
		return method;
	}

	/**
	 * This method extract the resource from the first line of the request
	 * 
	 * @param linea
	 *            the first line in the request
	 * @return the resource
	 */
	public static String getResource(String linea) {
		String recurso = null;
		try {
			StringTokenizer st = new StringTokenizer(linea, " ");
			st.nextToken();
			recurso = st.nextToken();
			recurso = recurso.substring(1, recurso.length());
		} catch (Exception ex) {
		}
		return recurso;
	}

	/**
	 * This method obtains all the headers of the request
	 * 
	 * @param in
	 *            the input stream
	 * @return all the headers
	 * @throws Exception
	 */
	public static HashMap<String, String> getHeaders(InputStream in)
			throws Exception {
		String line;

		HashMap<String, String> headers = new HashMap<String, String>();

		while (!(line = readLine(in)).equals("")) {
			int pos = line.indexOf(':');
			headers.put(line.substring(0, pos),
					line.substring(pos + 1, line.length()));
		}

		return headers;
	}

	/**
	 * This method prints all the headers
	 * 
	 * @param headers
	 */
	public static void showHeaders(HashMap<String, String> headers) {
		System.out.println("Cabeceras de la peticion: ");
		Set<String> claves = headers.keySet();

		for (String c : claves)
			System.out.println(c + ": " + headers.get(c));
	}

	/**
	 * This method tests if the resource is in a path that requires
	 * authorization
	 * 
	 * @param linea
	 *            the first line of the request
	 * @param authPrefix
	 *            the prefix of the paths that require authorization
	 * @return true if requires authorization, false otherwise
	 */
	public static boolean requiresAuthentication(String linea, String authPrefix) {
		return linea.contains(authPrefix);
	}

	/**
	 * This method decodes Base64 and obtains the user
	 * 
	 * @param auth
	 *            the Base64 encoded Authorization
	 * @return the user
	 */
	public static String getUser(String auth) {
		String line = new String(DatatypeConverter.parseBase64Binary(auth));
		String[] data = line.split(":");
		return data[0];
	}

	/**
	 * This method decodes Base64 and obtains the password
	 * 
	 * @param auth
	 *            the Base64 encoded Authorization
	 * @return the password
	 */
	public static String getPass(String auth) {
		// Esto es para conversion a Base64
		// String line = DatatypeConverter.printBase64Binary(auth.getBytes());
		String line = new String(DatatypeConverter.parseBase64Binary(auth));
		String[] data = line.split(":");
		return data[1];
	}

	/**
	 * This method tests if the request is asking for the password file
	 * 
	 * @param linea/home/juan/trabajo/workspaces/workspaceWeb/1_HTTPDynamicCgiServer/src
	 *            the first line in the request
	 * @param passFile
	 *            the name of the password file
	 * @return
	 */
	public static boolean isPassFile(String linea, String passFile) {
		return linea.contains(passFile);
	}

	/**
	 * This method returns the full path of the password file
	 * 
	 * @param recurso
	 *            the resource of the request
	 * @param path
	 *            the path where is located all the server pages
	 * @param passFileName
	 *            the name of the file that stores the user and password
	 * @return the full path to the user/password file
	 */
	public static String getPathToPassFile(String recurso, String path,
			String passFileName) {
		String pathPassFile = path;
		try {
			StringTokenizer st = new StringTokenizer(recurso, "/");
			String app = st.nextToken();
			pathPassFile = path + app + "/" + passFileName;

		} catch (Exception ex) {
		}
		return pathPassFile;
	}

	/**
	 * This method writes the response headers in the output stream
	 * 
	 * @param pw
	 *            the output stream
	 * @param hm
	 *            the headers
	 */
	public static void writeHeaders(PrintWriter pw, HashMap<String, String> hm) {
		for (String clave : hm.keySet()) {
			pw.print(clave);
			pw.println(": ");
			pw.println(hm.get(clave));
		}
		pw.println();
		pw.flush();
	}

	/**
	 * This method writes the first line of a successful response (200)
	 * 
	 * @param pw
	 *            the output stream
	 */
	public static void writeResponseLineOK(PrintWriter pw) {
		pw.println("HTTP/1.1 200 OK");
		pw.flush();
	}

	/**
	 * This method writes the response telling the browser that user/password is
	 * needed
	 * 
	 * @param pw
	 *            the output stream
	 */
	public static void writeResponseRequiresAuthorization(PrintWriter pw) {
		pw.println("HTTP/1.1 401 Access Denied");
		String message = "<h1> Authentication is required </h1>";
		HashMap<String, String> responseCabs = new HashMap<String, String>();
		responseCabs.put("Content-Length", message.length() + "");
		responseCabs.put("Content-Type", "text/html; charset=utf-8");
		responseCabs.put("WWW-Authenticate","Basic realm=\"Private resource\"");
        writeHeaders(pw, responseCabs);
		pw.println(message);
		pw.flush();
	}

	/**
	 * This method writes a response that informs the user that the resource is
	 * not public
	 * 
	 * @param pw
	 *            the output stream
	 */
	public static void writeForbidden(PrintWriter pw) {
		pw.println("HTTP/1.1 403 Forbidden");
		pw.flush();
		String message = "The server understands your request but the server cannot perform that action";
		HashMap<String, String> responseCabs = new HashMap<String, String>();
		responseCabs.put("Content-Length", message.length() + "");
		responseCabs.put("Status", "403 Forbidden");
		responseCabs.put("Content-Type", "text/html; charset=utf-8");
		writeHeaders(pw, responseCabs);
		pw.println(message);
		pw.flush();
	}

	/**
	 * This method writes a response that informs the user that the resource is
	 * not found in the server
	 * 
	 * @param pw
	 *            the output stream
	 * @param recurso
	 *            the resource requested
	 */
	public static void writeResponseNotFound(PrintWriter pw, String recurso) {
		pw.println("HTTP/1.1 404 Not Found");
		StringBuffer sb = new StringBuffer();
		sb.append("</h1> The resource <b>");
		sb.append(recurso);
		sb.append(" </b> is not in this server </h1>");
		int tam = sb.toString().getBytes().length;
		HashMap<String, String> responseCabs = new HashMap<String, String>();
		responseCabs.put("Content-Length", tam + "");
		responseCabs.put("Content-Type", "text/html");
		writeHeaders(pw, responseCabs);
		pw.print(sb.toString());
		pw.flush();
	}

	/**
	 * This method writes a response that informs the user that there has been
	 * an internal error in the server
	 * 
	 * @param pw
	 *            the output stream
	 */
	public static void writeResponseServerError(PrintWriter pw) {
		pw.println("HTTP/1.1 500 Internal Server Error");
		String message = "</h1> Internal server error! </h1>";
		int tam = message.getBytes().length;
		HashMap<String, String> responseCabs = new HashMap<String, String>();
		responseCabs.put("Content-Length", tam + "");
		responseCabs.put("Content-Type", "text/html");
		writeHeaders(pw, responseCabs);
		pw.print(message);
		pw.flush();
	}

	/**
	 * This method writes a response that informs the user that the HTTP method
	 * is not implemented
	 * 
	 * @param pw
	 *            the output stream
	 * @param method
	 *            the HTTP method in the request
	 */
	public static void writeResponseNotImplemented(PrintWriter pw, String method) {
		pw.println("HTTP/1.1 501 Not implemented");
		StringBuffer sb = new StringBuffer();
		sb.append("</h1> ");
		sb.append(method);
		sb.append(" is not implemented in this server </h1>");
		int tam = sb.toString().getBytes().length;
		HashMap<String, String> responseCabs = new HashMap<String, String>();
		responseCabs.put("Content-Length", tam + "");
		responseCabs.put("Content-Type", "text/html");
		writeHeaders(pw, responseCabs);
		pw.print(sb.toString());
		pw.flush();
	}

	/**
	 * This method is used to add to the response header the Content-Type of the
	 * resource
	 * 
	 * @param responseCabs
	 *            the response headers
	 * @param recurso
	 *            the resource being requested
	 */
	public static void addResponseHeaderContentType(
			HashMap<String, String> responseCabs, String recurso) {
		String extension = recurso.substring(recurso.lastIndexOf('.') + 1,
				recurso.length());

		// Si en lugar de image/png ponemos text/html el navegador lo interpreta
		// como texto

		// Some MIME types (this is just a sample)
		if (extension.equals("html"))
			responseCabs.put("Content-Type", "text/html");
		else if (extension.equals("png"))
			responseCabs.put("Content-Type", "image/png");
		else if (extension.equals("jpg"))
			responseCabs.put("Content-Type", "image/jpeg");
		else if (extension.equals("js"))
			responseCabs.put("Content-Type", "text/javascript");
		else if (extension.equals("css"))
			responseCabs.put("Content-Type", "text/css");
		else if (extension.equals("pdf"))
			responseCabs.put("Content-Type", "application/pdf");
		else if (extension.equals("json"))
			responseCabs.put("Content-Type", "text/json");
		else if (extension.equals("txt"))
			responseCabs.put("Content-Type", "text/plain");
		else if (extension.equals("java"))
			responseCabs.put("Content-Type", "text/plain");

	}

	/**
	 * This method writes the status line, the response headers and the resource
	 * 
	 * @param pw
	 *            the output stream (as a PrintWriter)
	 * @param out
	 *            the output stream (as an OutputStream)
	 * @param recurso
	 *            the resource
	 */

	public static void writeResource(PrintWriter pw, OutputStream out,
			String recurso) {
		File f = new File(recurso);

		System.out.println("Path of the resource: " + f.getAbsolutePath());

		if (!f.exists())
			UtilsHTTP.writeResponseNotFound(pw, recurso);
		else if (f.isDirectory())
			UtilsHTTP.writeForbidden(pw);
		else

			try {
				long tam = f.length();

				UtilsHTTP.writeResponseLineOK(pw);

				HashMap<String, String> responseCabs = new HashMap<String, String>();
				responseCabs.put("Content-Length", tam + "");

				UtilsHTTP.addResponseHeaderContentType(responseCabs, recurso);

				UtilsHTTP.writeHeaders(pw, responseCabs);

				FileInputStream inFile = new FileInputStream(recurso);

				byte[] datos = new byte[1024];
				int leidos;

				while ((leidos = inFile.read(datos, 0, 1024)) > 0)
					out.write(datos, 0, leidos);

				out.flush();
				inFile.close();

				System.out.println("---------- FIN PETICION");
			} catch (Exception ex) {
				UtilsHTTP.writeResponseServerError(pw);
			}
	}
}
