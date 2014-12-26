package es.uv.isw.sparrow.registereduser.showfollowers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import es.uv.isw.sparrow.bean.Follower;
import es.uv.isw.sparrow.bean.User;
import es.uv.isw.sparrow.dao.MySQLUserDAO;
import es.uv.isw.sparrow.dao.UserDAO;

public class SearchFollowers {
	
	private ArrayList<User> userList;	
	private static UserDAO userDao;
	private int userId;
	
	
	public SearchFollowers(int id){
		this.userId=id;
		userDao = new MySQLUserDAO();
		userList=new ArrayList<User>();
		
		try {
			userList=userDao.getAllUsers();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}

	public ArrayList<Follower> doSearch(){
		ArrayList<Follower> followerList=new ArrayList<Follower>();
		ArrayList<Follower> followerLoop=new ArrayList<Follower>();			
		
		try {
			followerLoop=userDao.getFollowers(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("id"+userId+" tama:"+followerLoop.size());
		return followerLoop;
	}
	

}
