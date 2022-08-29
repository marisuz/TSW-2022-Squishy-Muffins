package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsegnaDAO {
	
	private static final String TABLE_NAME = "consegna";
	
	public synchronized void doSave(ConsegnaBean ogg) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String ID = "SELECT id_consegna FROM squishy_muffins.consegna ORDER BY id_consegna DESC LIMIT 1";
		
		String insertSQL = "INSERT INTO " + ConsegnaDAO.TABLE_NAME
				+ " (id_consegna, via, cap, numero, citta)"
				+ " VALUES (?, ?, ?, ?, ?)";
		
		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			
			PreparedStatement query = connection.prepareStatement(ID);
			
			ResultSet id = query.executeQuery();
			
			id.next();
			int CID = id.getInt("id_consegna") + 1;
			
			
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, ogg.getIdconsegna());
			preparedStatement.setString(2, ogg.getVia());
			preparedStatement.setInt(3, ogg.getCap());
			preparedStatement.setInt(4, ogg.getNumero());
			preparedStatement.setString(5, ogg.getCitta());
	
			preparedStatement.executeUpdate();

				//connection.commit(); //Salva le modifiche sul database
		} 
		finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
	public synchronized ConsegnaBean doRetrieveByKey(int id_consegna) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ConsegnaBean bean = new ConsegnaBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id_consegna = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id_consegna);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				bean.setIdconsegna(rs.getInt("id_consegna"));
				bean.setVia(rs.getString("via"));
				bean.setNumero(rs.getInt("numero"));
				bean.setCap(rs.getInt("cap"));
				bean.setCitta(rs.getString("citta"));
			}

		} 
		finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return bean;
	}
	
	public synchronized boolean doDelete(int id_consegna) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ConsegnaDAO.TABLE_NAME + " WHERE id_consegna = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, id_consegna);

			result = preparedStatement.executeUpdate();

		}
		finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return (result != 0);
	}
	
	
	
}
