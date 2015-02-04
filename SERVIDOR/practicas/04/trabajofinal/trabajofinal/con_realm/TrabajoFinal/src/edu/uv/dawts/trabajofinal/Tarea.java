package edu.uv.dawts.trabajofinal;

import java.util.Date;

//JavaBean Tarea
public class Tarea {
	private int id;
	private String nombre;
	private int proyecto;
	private Date fechaTope;
	private Date fechaFinalizacion;
	private int programador;

	public Tarea() {
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setNombre(String n) {
		nombre = n;
	}

	public void setProyecto(int p) {
		proyecto = p;
	}

	public void setFechaTope(Date d) {
		fechaTope = d;
	}

	public void setFechaFinalizacion(Date d) {
		fechaFinalizacion = d;
	}

	public void setProgramador(int p) {
		programador = p;
	}

	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public int getProyecto() {
		return proyecto;
	}

	public Date getFechaTope() {
		return fechaTope;
	}

	public Date getFechaFinalizacion() {
		return fechaFinalizacion;
	}

	public int getProgramador() {
		return programador;
	}
}
