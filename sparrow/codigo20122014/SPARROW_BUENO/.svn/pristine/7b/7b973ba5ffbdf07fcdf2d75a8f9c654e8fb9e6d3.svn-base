package es.uv.isw.sparrow.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import es.uv.isw.sparrow.bean.Follower;
import es.uv.isw.sparrow.bean.User;

public interface UserDAO {
	public User findById(int id) throws SQLException;
	public ArrayList<User> getAllUsers() throws SQLException;
	public User findByUsername(String uname) throws SQLException;
	public ArrayList<User> findByName(String n) throws SQLException;
	public void insert(User e) throws SQLException;
	public void delete(User e) throws SQLException;
	public void update(User e) throws SQLException;
	public String findByUsernameAndEmail(String username, String email) throws SQLException;
	// People I follow up
	public ArrayList<Follower> getFollowings(int user) throws SQLException;
	// People that follows me up
	public ArrayList<Follower> getFollowers(int user) throws SQLException;
	// People that follows me up but I don't follow
	public ArrayList<Follower> getFollowersNotFollowed(int user) throws SQLException;
	// People I'm following up but doesn't follows me up
	public ArrayList<Follower> getFollowedNotFollowing(int user) throws SQLException;
	// Follow an user
	public void follow(int user, int followed) throws SQLException;
	// Unfollow an user
	public void unfollow(int user, int followed)  throws SQLException;
}
