package es.uv.isw.sparrow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import es.uv.isw.sparrow.bean.Follower;
import es.uv.isw.sparrow.bean.User;

public class MySQLUserDAO implements UserDAO {
	private static String FINDBYID = 
			"SELECT id, username, password, eMail, nombre, apellidos, sexo, idioma" +
			"  FROM users" +
			" WHERE id = ?";
		private static String UPDATE = 
			"UPDATE users SET password = ?, nombre = ?, apellidos = ?, sexo = ?, idioma = ? " +
			"WHERE id = ?";
	
		private static String INSERT =
			"INSERT INTO users(username, password, eMail, nombre, apellidos, sexo, idioma) " +
			"VALUES (?, ?, ?, ?, ?, ?, ?)";

		private static String DELETE =
			"DELETE FROM users" +
			" WHERE id = ?";

		private static String READALL =
			"SELECT id, username, password, eMail, nombre, apellidos, sexo, idioma" +
		    "  FROM users" +
		    " ORDER BY id";

		private static String FINDBYUSERNAME = 
				"SELECT id, username, password, eMail, nombre, apellidos, sexo, idioma" +
				"  FROM users" +
				" WHERE username = ?";

		private static String FINDBYNAME =
			"SELECT id, username, password, eMail, nombre, apellidos, sexo, idioma" +
		    "  FROM users" +
			" WHERE apellidos LIKE %?%";
		
		private static String FINDBYUSERNAMEANDMAIL = 
				"SELECT password" +
				"  FROM users" +
				" WHERE username = ? AND eMail = ?";

		private static String FOLLOWINGS = 
				"SELECT u.id, u.username, u.eMail, u.nombre, u.apellidos, u.sexo, u.idioma, f.since" +
				"  FROM users u JOIN followings f ON u.id = f.followed " +
				" WHERE f.user = ?";
		
		private static String FOLLOWERS = 
				"SELECT u.id, u.username, u.eMail, u.nombre, u.apellidos, u.sexo, u.idioma, f.since" +
				"  FROM users u JOIN followings f ON u.id = f.user " +
				" WHERE f.followed = ?";
		
		private static String FOLLOWERSNOTFOLLOWED =
				"SELECT u.id, u.username, u.eMail, u.nombre, u.apellidos, u.sexo, u.idioma" +
				"  FROM users u JOIN followings f ON u.id = f.user " +
				" WHERE f.followed = ? " +
				"   AND f.user NOT IN ( " +
				"          SELECT ff.followed " +
				"            FROM followings ff " +
				"           WHERE ff.user = ?" +
				"       )";

		private static String FOLLOWEDNOTFOLLOWING = 
				"SELECT u.id, u.username, u.eMail, u.nombre, u.apellidos, u.sexo, u.idioma, f.since " +
		      "  FROM users u JOIN followings f ON u.id = f.followed " +
		      " WHERE user = ? " +
		      "   AND f.followed NOT IN (" +
		      "          SELECT ff.user " +
		      "            FROM followings ff " +
		      "           WHERE ff.followed = ?" +
		      "       )";
				
		private static String FOLLOW =
				"INSERT INTO followings(user, followed) " +
		        "VALUES (?, ?)";
		
		private static String UNFOLLOW =
				"DELETE FROM followings " +
			    " WHERE user = ? AND followed = ?";
		
		private Connection conn = null;
		
		public MySQLUserDAO() {
			super();
			try {
				conn = SparrowConnFactory.getConnection();
			} catch (Exception e) {
				System.out.println("MySQLUserDao: Error obteniendo conexión a la base de datos.");
				System.out.println("MySQLUserDao: " + e.getMessage());
			}
		}

		@Override
		public void update(User e) throws SQLException {
			PreparedStatement sqlQuery = conn.prepareStatement(UPDATE);
			
			sqlQuery.setString(1, e.getPassword());
			sqlQuery.setString(2, e.getNombre());
			sqlQuery.setString(3, e.getApellidos());
			sqlQuery.setString(4, e.getSexo());
			sqlQuery.setString(5, e.getIdioma());
			sqlQuery.setInt(6, e.getId());
			sqlQuery.executeUpdate();
			//conn.commit();
		}

	@Override
	public User findById(int id) throws SQLException {
		User user = null;
		PreparedStatement sqlQuery = conn.prepareStatement(FINDBYID);
		sqlQuery.setInt(1, id);

		ResultSet rs = sqlQuery.executeQuery();
		rs.last();
		int rowcount = rs.getRow();
		if (rowcount == 1) {
			rs.first();
			user = new User();
			user.setId(rs.getInt(1));
			user.setUsername(rs.getString(2));
			user.setPassword(rs.getString(3));
			user.seteMail(rs.getString(4));
			user.setNombre(rs.getString(5));
			user.setApellidos(rs.getString(6));
			user.setSexo(rs.getString(7));
			user.setIdioma(rs.getString(8));
		}
		return user;
	}
	
	@Override
	public String findByUsernameAndEmail(String username, String email) throws SQLException {
		String password = null;
		PreparedStatement sqlQuery = conn.prepareStatement(FINDBYUSERNAMEANDMAIL);
		
		sqlQuery.setString(1, username);
		sqlQuery.setString(2, email);

		ResultSet rs = sqlQuery.executeQuery();
		rs.last();
		int rowcount = rs.getRow();
		if (rowcount == 1) {
			rs.first();
			password = rs.getString(1);			
		}
		return password;
	}

	@Override
	public ArrayList<User> getAllUsers() throws SQLException {
		ArrayList<User> users = new ArrayList<User>();
		PreparedStatement sqlQuery = conn.prepareStatement(READALL);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			User user = new User(rs.getString("username"), rs.getString("password"), 
				rs.getString("eMail"),rs.getString("nombre"), rs.getString("apellidos"), 
				rs.getString("sexo"), rs.getString("idioma"));
			user.setId(rs.getInt("id"));
			
			users.add(user);
		}
		return users;
	}

	@Override
	public ArrayList<User> findByName(String n) throws SQLException {
		ArrayList<User> users = new ArrayList<User>();
		PreparedStatement sqlQuery = conn.prepareStatement(FINDBYNAME);
		sqlQuery.setString(1, n);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			User user = new User(rs.getString("username"), rs.getString("password"), 
				rs.getString("eMail"), rs.getString("nombre"), rs.getString("apellidos"), 
				rs.getString("sexo"), rs.getString("idioma"));
			user.setId(rs.getInt("id"));
			
			users.add(user);
		}
		return users;
	}

	@Override
	public void insert(User e) throws SQLException {
		PreparedStatement sqlQuery = conn.prepareStatement(INSERT);
		
		sqlQuery.setString(1, e.getUsername());
		sqlQuery.setString(2, e.getPassword());
		sqlQuery.setString(3, e.geteMail());
		sqlQuery.setString(4, e.getNombre());
		sqlQuery.setString(5, e.getApellidos());
		sqlQuery.setString(6, e.getSexo());
		sqlQuery.setString(7, e.getIdioma());
		
		sqlQuery.executeUpdate();
		//conn.commit();
	}

	@Override
	public void delete(User e) throws SQLException {
		PreparedStatement sqlQuery = conn.prepareStatement(DELETE);
		sqlQuery.setInt(1, e.getId());
		sqlQuery.executeUpdate();
	}

	@Override
	public User findByUsername(String uname) throws SQLException {
		User user = null;
		PreparedStatement sqlQuery = conn.prepareStatement(FINDBYUSERNAME);
		sqlQuery.setString(1, uname);

		ResultSet rs = sqlQuery.executeQuery();
		rs.last();
		int rowcount = rs.getRow();
		if (rowcount == 1) {
			rs.first();
			user = new User();
			user.setId(rs.getInt(1));
			user.setUsername(rs.getString(2));
			user.setPassword(rs.getString(3));
			user.seteMail(rs.getString(4));
			user.setNombre(rs.getString(5));
			user.setApellidos(rs.getString(6));
			user.setSexo(rs.getString(7));
			user.setIdioma(rs.getString(8));
		}		
		return user;
	}

	@Override
	public ArrayList<Follower> getFollowings(int user) throws SQLException {
		ArrayList<Follower> following = new ArrayList<Follower>();
		PreparedStatement sqlQuery = conn.prepareStatement(FOLLOWINGS);
		sqlQuery.setInt(1, user);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Date date = rs.getTimestamp("since");
			Follower followed = new Follower(rs.getInt("id"), rs.getString("username"), 
				rs.getString("eMail"), rs.getString("nombre"), rs.getString("apellidos"), 
				rs.getString("sexo"), rs.getString("idioma"), date);
			
			following.add(followed);
		}
		return following;
	}

	@Override
	public ArrayList<Follower> getFollowers(int user) throws SQLException {
		ArrayList<Follower> followers = new ArrayList<Follower>();
		PreparedStatement sqlQuery = conn.prepareStatement(FOLLOWERS);
		sqlQuery.setInt(1, user);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Date date = rs.getTimestamp("since");
			Follower follower = new Follower(rs.getInt("id"), rs.getString("username"), 
				rs.getString("eMail"), rs.getString("nombre"), rs.getString("apellidos"), 
				rs.getString("sexo"), rs.getString("idioma"), date);
			
			followers.add(follower);
		}
		return followers;
	}

	/*
	 * since is allways null. 
	 */
	@Override
	public ArrayList<Follower> getFollowersNotFollowed(int user) throws SQLException {
		ArrayList<Follower> followers = new ArrayList<Follower>();
		PreparedStatement sqlQuery = conn.prepareStatement(FOLLOWERSNOTFOLLOWED);
		sqlQuery.setInt(1, user);
		sqlQuery.setInt(2, user);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Follower follower = new Follower(rs.getInt("id"), rs.getString("username"), 
				rs.getString("eMail"), rs.getString("nombre"), rs.getString("apellidos"), 
				rs.getString("sexo"), rs.getString("idioma"), null);
			
			followers.add(follower);
		}
		return followers;
	}

	/*
	 * since is allways null. 
	 */
	@Override
	public ArrayList<Follower> getFollowedNotFollowing(int user) throws SQLException {
		ArrayList<Follower> followed = new ArrayList<Follower>();
		PreparedStatement sqlQuery = conn.prepareStatement(FOLLOWEDNOTFOLLOWING);
		sqlQuery.setInt(1, user);
		sqlQuery.setInt(2, user);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Follower follower = new Follower(rs.getInt("id"), rs.getString("username"), 
				rs.getString("eMail"), rs.getString("nombre"), rs.getString("apellidos"), 
				rs.getString("sexo"), rs.getString("idioma"), null);
			
			followed.add(follower);
		}
		return followed;
	}

	@Override
	public void follow(int user, int followed) throws SQLException {
		PreparedStatement sqlQuery = conn.prepareStatement(FOLLOW);
		sqlQuery.setInt(1, user);
		sqlQuery.setInt(2, followed);
		
		sqlQuery.executeUpdate();
	}

	@Override
	public void unfollow(int user, int followed) throws SQLException {
		PreparedStatement sqlQuery = conn.prepareStatement(UNFOLLOW);
		sqlQuery.setInt(1, user);
		sqlQuery.setInt(2, followed);
		
		sqlQuery.executeUpdate();
	}

}
