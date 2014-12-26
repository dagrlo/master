package es.uv.isw.sparrow.bean;

import java.sql.SQLException;

import es.uv.isw.sparrow.dao.MySQLUserDAO;

/**
 * An implmentation of the mailing bean interface, using local
 * variables as storage.
 */
public class UserBeanImpl implements UserBean {
    /** the username */
    private String username;
    
    /** the password */
    private String password;
    
    /** whether the user is logged in or not */
    private boolean loggedIn;
    
    MySQLUserDAO mySqlUSer = new MySQLUserDAO();
    private int id;
    private String name;

    
    public UserBeanImpl() {
   	 username = "";
   	 password = "";
   	 loggedIn = false;
   }

	/**
     * Get the user name
     * @return user name
     */
	@Override
	public String getUsername() {
		return username;
	}

	/**
	 * Set the user name
	 */
	@Override
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * Get the password
	 * @return password
	 */
	@Override
	public String getPassword() {
		return password;
	}

	/**
	 * Set the password
	 */
	@Override
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	/**
	 * Get the password
	 * @return password
	 */
	@Override
	public int getId() {
		return id;
	}

	/**
	 * Set the password
	 */
	@Override
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	/**
	 * Get the password
	 * @return password
	 */
	@Override
	public String getName() {
		return name;
	}

	/**
	 * Set the password
	 */
	@Override
	public void setName(String name) {
		this.name = name;
	}
	

    /**
     * Business method to actually perform login. This method
     * just checks that the password exists and is longer than 3
     * characters long
     * @throws SQLException 
     */
	@Override
	public boolean doLogin(String username, String password) throws SQLException {
		
		User u = mySqlUSer.findByUsername(username);	
		
		if (u != null && password.equals(u.getPassword())) {
			id = u.getId();
			name = u.getUsername();
			
			loggedIn = false;
		}
		else {
			loggedIn = true;
		}
		return loggedIn;
	}
	
   /**
    * Determine if we are currently logged in or not
    */
	@Override
	public boolean isLoggedIn() {
		return loggedIn;
	}
}
