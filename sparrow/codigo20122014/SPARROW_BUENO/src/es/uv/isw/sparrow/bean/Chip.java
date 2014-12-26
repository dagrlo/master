package es.uv.isw.sparrow.bean;

public class Chip {
	private int id;
	private String tag;
	private String text;
	private int thread;
	private int user;

	public Chip() {
		super();
		this.id = -1;
		this.tag = null;
		this.text = null;
		this.thread = -1;
		this.user = 0;
	}

	public Chip(String tag, String text, int thread, int user) {
		super();
		this.id = -1;
		this.tag = tag;
		this.text = text;
		this.thread = thread;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getThread() {
		return thread;
	}
	public void setThread(int thread) {
		this.thread = thread;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	
	
}
