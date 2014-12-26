package es.uv.isw.sparrow.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import es.uv.isw.sparrow.bean.Chip;

public interface ChipDAO {
	public void insert(Chip c) throws SQLException;
	public Chip findById(int id) throws SQLException;
	public ArrayList<Chip> getAllChips() throws SQLException;
	public ArrayList<Chip> findByUser(int user) throws SQLException;
	public ArrayList<Chip> findByTag(String tag)  throws SQLException;
	public ArrayList<Chip> findByThread(int thread) throws SQLException;
	public ArrayList<Chip> getThreads() throws SQLException;
	public ArrayList<String> getTags() throws SQLException;
	public void delete(Chip c) throws SQLException;
}
