package edu.uv.cgiresponse;

import java.util.ArrayList;
import java.util.List;

/**
 * This is not a production Dynamic HTTP Server. It is intended for TEACHING
 * purposes.
 * 
 * Use at your own risk!
 */

public class ProcessAndArgsOrder {
	private String process;
	private List<String> argumentOrder;

	public ProcessAndArgsOrder() {
		argumentOrder = new ArrayList<String>();
	}

	public void setProcess(String p) {
		process = p;
	}

	public void addArgument(String arg) {
		argumentOrder.add(arg);
	}

	public String getProcess() {
		return process;
	}

	public List<String> getArgumentOrder() {
		return argumentOrder;
	}
}