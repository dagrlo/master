package es.uv.isw.sparrow.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Follower {
	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private int id;
	private String username;
	private String eMail;
	private String nombre;
	private String apellidos;
	private String sexo;
	private String idioma;
	private Date since;
	
	public Follower(int id, String username, String eMail, String nombre,
         String apellidos, String sexo, String idioma, Date since) {
		super();
	   this.id = id;
	   this.username = username;
	   this.eMail = eMail;
	   this.nombre = nombre;
	   this.apellidos = apellidos;
	   this.sexo = sexo;
	   this.idioma = idioma;
	   this.since = since;
   }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public String geteMail() {
		return eMail;
	}
	public String getNombre() {
		return nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public String getSexo() {
		return sexo;
	}
	public String getIdioma() {
		return idioma;
	}
	public String getSince() {
		if (since != null) {
			return dateFormat.format(since);
		}
		else {
			return "No date recorded";
		}
	}	
}
