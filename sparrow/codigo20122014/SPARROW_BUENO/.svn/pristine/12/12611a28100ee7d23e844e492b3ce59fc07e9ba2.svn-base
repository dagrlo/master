package es.uv.isw.sparrow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import es.uv.isw.sparrow.bean.Chip;

public class MySQLChipDAO implements ChipDAO {

	private static String FINDBYID = 
		"SELECT id, tag, text, thread, user" +
		"  FROM chips" +
		" WHERE id = ?";

	private static String INSERT =
		"INSERT INTO chips(tag, text, thread, user) " +
		"VALUES (?, ?, ?, ?)";

	private static String DELETE =
		"DELETE FROM chips" +
		" WHERE id = ?";

	private static String READALL =
		"SELECT id, tag, text, thread, user" +
	    "  FROM chips" +
	    " ORDER BY id";

	private static String FINDBYUSER =
		"SELECT id, tag, text, thread, user" +
	    "  FROM chips" +
		" WHERE user = ?" +
	    " ORDER BY id";

	private static String FINDBYTAG =
		"SELECT id, tag, text, thread, user" +
	    "  FROM chips" +
		" WHERE tag = ?" +
	    " ORDER BY id";	

	private static String FINDBYTHREAD =
			"SELECT id, tag, text, thread, user" +
		    "  FROM chips" +
			" WHERE thread = ?" +
		    " ORDER BY id";
	
	private static String GETTHREADS =
			"SELECT id, tag, text, thread, user" +
		    "  FROM chips" +
			" WHERE thread IS NULL" +
		    " ORDER BY id";

	private static String GETTAGS =
			"SELECT DISTINCT tag" +
		    "  FROM chips";

	private Connection conn = null;
	
	public MySQLChipDAO() {
		super();
		try {
			conn = SparrowConnFactory.getConnection();
		} catch (Exception e) {
			System.out.println("MySQLChipDao: Error obteniendo conexión a la base de datos.");
			System.out.println("MySQLChipDao: " + e.getMessage());
		}
	}

	@Override
	public Chip findById(int id) throws SQLException {
		Chip chip = new Chip();
		PreparedStatement sqlQuery = conn.prepareStatement(FINDBYID);
		sqlQuery.setInt(1, id);

		ResultSet rs = sqlQuery.executeQuery();
		rs.last();
		int rowcount = rs.getRow();
		if (rowcount == 1) {
			rs.first();
			chip.setId(rs.getInt(1));
			chip.setTag(rs.getString(2));
			chip.setText(rs.getString(3));
			chip.setThread(rs.getInt(4));
			chip.setUser(rs.getInt(5));
		}
		return chip;
	}

	@Override
	public ArrayList<Chip> getAllChips() throws SQLException {
		ArrayList<Chip> chips = new ArrayList<Chip>();
		PreparedStatement sqlQuery = conn.prepareStatement(READALL);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Chip chip = new Chip(rs.getString("tag"), rs.getString("text"), 
				rs.getInt("thread"), rs.getInt("user"));
			chip.setId(rs.getInt("id"));
			
			chips.add(chip);
		}
		return chips;
	}
	
	@Override
	public void delete(Chip c) throws SQLException {
		PreparedStatement sqlQuery = conn.prepareStatement(DELETE);
		sqlQuery.setInt(1, c.getId());
		sqlQuery.executeUpdate();
	}

	@Override
	public void insert(Chip c) throws SQLException {
		PreparedStatement sqlQuery = conn.prepareStatement(INSERT);
		
		sqlQuery.setString(1, c.getTag());
		sqlQuery.setString(2, c.getText());
		// Manejamos el posible valor nulo
		if (c.getThread() == -1) {
			sqlQuery.setNull(3, Types.INTEGER);
		}
		else { 
			sqlQuery.setInt(3, c.getThread());
		}
		sqlQuery.setInt(4, c.getUser());

		sqlQuery.executeUpdate();
		//conn.commit();
	}

	@Override
	public ArrayList<Chip> findByUser(int user) throws SQLException {
		ArrayList<Chip> chips = new ArrayList<Chip>();
		PreparedStatement sqlQuery = conn.prepareStatement(FINDBYUSER);
		sqlQuery.setInt(1, user);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Chip chip = new Chip(rs.getString("tag"), rs.getString("text"), 
				rs.getInt("thread"), rs.getInt("user"));
			chip.setId(rs.getInt("id"));
			
			chips.add(chip);
		}
		return chips;
	}

	@Override
	public ArrayList<Chip> findByTag(String tag) throws SQLException {
		ArrayList<Chip> chips = new ArrayList<Chip>();
		PreparedStatement sqlQuery = conn.prepareStatement(FINDBYTAG);
		sqlQuery.setString(1, tag);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Chip chip = new Chip(rs.getString("tag"), rs.getString("text"), 
				rs.getInt("thread"), rs.getInt("user"));
			chip.setId(rs.getInt("id"));
			
			chips.add(chip);
		}
		return chips;
	}

	@Override
	public ArrayList<Chip> findByThread(int thread) throws SQLException {
		ArrayList<Chip> chips = new ArrayList<Chip>();
		PreparedStatement sqlQuery = conn.prepareStatement(FINDBYTHREAD);
		sqlQuery.setInt(1, thread);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Chip chip = new Chip(rs.getString("tag"), rs.getString("text"), 
				rs.getInt("thread"), rs.getInt("user"));
			chip.setId(rs.getInt("id"));
			
			chips.add(chip);
		}
		return chips;
	}
	
	public ArrayList<Chip> getThreads() throws SQLException {
		ArrayList<Chip> chips = new ArrayList<Chip>();
		PreparedStatement sqlQuery = conn.prepareStatement(GETTHREADS);
		
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			Chip chip = new Chip(rs.getString("tag"), rs.getString("text"), 
				rs.getInt("thread"), rs.getInt("user"));
			chip.setId(rs.getInt("id"));
			
			chips.add(chip);
		}
		return chips;
	}
	
	public ArrayList<String> getTags() throws SQLException {
		ArrayList<String> tags = new ArrayList<String>();
		PreparedStatement sqlQuery = conn.prepareStatement(GETTAGS);
	
		ResultSet rs = sqlQuery.executeQuery();
		rs.beforeFirst();
		while (rs.next()) {
			tags.add(rs.getString("tag"));
		}
		return tags;
	}	
}
