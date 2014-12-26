package es.uv.isw.sparrow.bean;

import java.sql.SQLException;

public class User {
	private int id;
	private String username;
	private String password;
	private String eMail;
	private String nombre;
	private String apellidos;
	private String sexo;
	private String idioma;

	
	public User() {
		super();
		this.id = -1;
		this.username = null;
		this.password = null;
		this.eMail = null;
		this.nombre = null;
		this.apellidos = null;
		this.sexo = null;
		this.idioma = null;
	}

	public User(String userName, String password, String eMail, 
			String nombre, String apellidos, String sexo, String idioma) {
		super();
		this.id = -1;
		this.username = userName;
		this.password = password;
		this.eMail = eMail;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.sexo = sexo;
		this.idioma = idioma;
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

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getIdioma() {
		return idioma;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}
	
	
}
