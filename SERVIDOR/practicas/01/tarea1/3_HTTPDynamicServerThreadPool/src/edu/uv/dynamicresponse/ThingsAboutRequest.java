package edu.uv.dynamicresponse;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Set;

public class ThingsAboutRequest {
	private HashMap<String, String> params;
	private HashMap<String, String> headers;
	private InputStream in;

	public ThingsAboutRequest(HashMap<String, String> h,
			HashMap<String, String> p, InputStream in) {
		params = p;
		headers = h;
		this.in = in;
	}

	public String getParam(String c) {
		return params.get(c);
	}

	public String getHeader(String c) {
		return headers.get(c);
	}

	public Set<String> getParamNames() {
		return params.keySet();
	}

	public Set<String> getPresentHeaders() {
		return headers.keySet();
	}

	InputStream getInputStream() {
		return in;
	}

}
