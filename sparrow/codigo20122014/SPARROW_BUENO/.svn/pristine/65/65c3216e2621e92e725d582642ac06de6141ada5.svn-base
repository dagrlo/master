package es.uv.isw.sparrow.registereduser.usersearch;

import java.sql.SQLException;
import java.util.ArrayList;

import es.uv.isw.sparrow.bean.User;
import es.uv.isw.sparrow.dao.MySQLUserDAO;

/**
 * This class is used to search users.
 * 
 * @author Gabriel Moreno Ibarra.
 */
public class UserSearch {
	
	/**
	 * Main para hacer pruebas.
	 * @param args
	 */
	public static void main(String[] args) {
		UserSearch uS = new UserSearch("Raj");
		
		for (int i = 0; i < uS.getUserNames().length; i++) {
			System.out.println("userName[" + i + "]: " + uS.getUserNames()[i]);
			System.out.println("Nombre[" + i + "]: " + uS.getNombres()[i]);
			System.out.println("Apellidos[" + i + "]: " + uS.getApellidos()[i]);
		}
		
		
	} // main()
	
	private ArrayList<User> registeredUsers; // Todos los usuarios registrados
	private String apellidos; // El apellido que a buscar
	private int[] indexes;
	private int count = 0;
	
	/**
	 * Constructor.
	 * @param apellidos Surname to search.
	 */
	public UserSearch(String apellidos) {
		this.apellidos = apellidos; // Asignamos al atributo de la clase
		
		// Recogemos todos los usuarios registrados:
		MySQLUserDAO mySQLUserDAO = new MySQLUserDAO();
		try {
			registeredUsers = mySQLUserDAO.getAllUsers();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Guardamos los índices en que los apellidos contengan caracteres que coincidan con los que hay en la DB.
		// Lo hacemos así para que si ponemos 'more', pille todos los 'moreno' y 'morena', por poner un ejemplo:
		String[] apellidosInDB = new String[registeredUsers.size()];
		indexes = new int[16]; // Con 16 apellidos tenemos de sobra (en principio)
		for (int i = 0; i < registeredUsers.size(); i++) {
			if(registeredUsers.get(i).getApellidos().contains(apellidos)) {
				indexes[count] = i;
				count++;
			}
		}
	} // UserSearch()
	
	/**
	 * @return the usernames of the coincident registered users.
	 */
	public String[] getUserNames() {
		String[] userNames = new String[count];
		for (int i = 0; i < count; i++) {
			userNames[i] = registeredUsers.get(indexes[i]).getUsername();
		}

		return userNames;
	} // getUserNames()
	
	/**
	 * @return the names of the coincident registered users.
	 */
	public String[] getNombres() {
		String[] nombres = new String[count];
		for (int i = 0; i < count; i++) {
			nombres[i] = registeredUsers.get(indexes[i]).getNombre();
		}

		return nombres;
	} // getNombres()
	
	/**
	 * @return the lastnames of the coincident registered users.
	 */
	public String[] getApellidos() {
		String[] apellidos = new String[count];
		for (int i = 0; i < count; i++) {
			apellidos[i] = registeredUsers.get(indexes[i]).getApellidos();
		}

		return apellidos;
	} // getApellidos()

} // UserSearch