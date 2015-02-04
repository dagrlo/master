package edu.uv.dynamicresponse;

import java.net.Socket;

public class ThreadDynamic implements Runnable {
	private Socket canal;
	private String clase;
	private String request;
	private SingleBuilder builder;

	
	public ThreadDynamic(Socket s, String cl, String req) {
		canal = s;
		clase = cl;
		request = req;
	}

	public void run() {
		builder.createInstance(canal, clase, request);		
	}
}
