package edu.uv.cgiresponse;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;

import edu.uv.common.*;

/**
 * This class deals with the response when the URL corresponds to a CGI call
 * 
 * @author juan
 * 
 */
public class ThreadCGI implements Runnable {
	private OutputStream out;
	private Socket canal;
	private String request;
	private ProcessAndArgsOrder pao;

	public ThreadCGI(Socket s, ProcessAndArgsOrder p, String req) {
		canal = s;
		request = req;
		try {
			out = s.getOutputStream();
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		pao = p;
	}

	public void run() {
		try {

			String requestMethod = UtilsHTTP.getMethod(request);
			String resource = UtilsHTTP.getResource(request);

			ArrayList<String> cmdLine = new ArrayList<String>();
			cmdLine.add(pao.getProcess());

			if (requestMethod.equals("GET")) {
				HashMap<String, String> pGet = UtilsHTTP.getParamsGet(resource);
				// Add the args in the correct order
				for (String arg : pao.getArgumentOrder()) {
					String v = URLDecoder.decode(pGet.get(arg), "UTF-8");
					cmdLine.add(v);

				}
				UtilsCGI.callProcess(out, cmdLine);

			} else if (requestMethod.equals("POST")) {
				InputStream in = canal.getInputStream();
				HashMap<String, String> pPost = UtilsHTTP.parseBody(UtilsHTTP
						.getBody(UtilsHTTP.getHeaders(in), in));
				// Add the args in the correct order
				for (String arg : pao.getArgumentOrder())
					cmdLine.add(pPost.get(arg));

				UtilsCGI.callProcess(out, cmdLine);
				in.close();
			} else
				UtilsHTTP.writeResponseNotImplemented(new PrintWriter(out),
						requestMethod);

		} catch (Exception ex) {
			UtilsHTTP.writeResponseServerError(new PrintWriter(out));
			System.out.println(ex.toString());
		} finally {
			try {
				out.close();
				canal.close();
			} catch (Exception ex) {
			}
		}
	}
}
