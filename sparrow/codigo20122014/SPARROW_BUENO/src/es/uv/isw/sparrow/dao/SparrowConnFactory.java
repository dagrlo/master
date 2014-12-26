package es.uv.isw.sparrow.dao;


import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class SparrowConnFactory  {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String DBURL = "jdbc:mysql://xtrempro.uv.es/sparrow";
	private static final String USERNAME = "sparrow";
	private static final String PASSWORD = "isaw";
	
	private static Connection conn = null;
	
	public static Connection getConnection() throws InstantiationException, 
			IllegalAccessException, ClassNotFoundException, SQLException  {
		if (conn == null || conn.isClosed()) {
			Class.forName(DRIVER).newInstance();
			conn = (Connection) DriverManager.getConnection(DBURL,USERNAME, PASSWORD);
		}		
		return conn;
	}	
}
