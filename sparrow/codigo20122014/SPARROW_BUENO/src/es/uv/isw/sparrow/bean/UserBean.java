package es.uv.isw.sparrow.bean;

import java.sql.SQLException;

/**
 * The interface to our model or a user
 */
public interface UserBean {
	// the username field
    public String getUsername();
    public void setUsername(String username);
    
    // the password field
    public String getPassword();
    public void setPassword(String password);
    
    
    public int getId();
    public void setId(int id);
    
    
    public String getName();
    public void setName(String name);
    
    // business methods to perform login
    public boolean doLogin(String username, String password)throws SQLException;
    public boolean isLoggedIn();
}
