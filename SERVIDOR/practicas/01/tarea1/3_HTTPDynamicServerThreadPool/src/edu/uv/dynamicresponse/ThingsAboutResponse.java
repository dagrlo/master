package edu.uv.dynamicresponse;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;

public class ThingsAboutResponse {
	private OutputStream out;
	private PrintWriter pw;
	private HashMap<String, String> headers;

	public ThingsAboutResponse(OutputStream o) {
		out = o;
		pw = new PrintWriter(out);
		headers = new HashMap<String, String>();
	}

	public OutputStream getOutputStream() {
		return out;
	}

	public void flushResponseHeaders() {
		for (String h : headers.keySet()) {
			pw.print(h);
			pw.print(": ");
			pw.println(headers.get(h));
		}
		pw.println("");
		pw.flush();
	}

	public void setResponseHeader(String h, String v) {
		headers.put(h, v);
	}

}
