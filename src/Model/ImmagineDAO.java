package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImmagineDAO {
	
	private static final String TABLE_NAME = "immagine";

	public synchronized  void doSave(ImmagineBean user) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		

		String insertSQL = "INSERT INTO " + ImmagineDAO.TABLE_NAME
					+ " (nome_immagine, path)"
					+ " VALUES (?, ?)";

		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getNome_immagine());
			preparedStatement.setString(2, user.getPath());
	
			preparedStatement.executeUpdate();

				connection.commit(); //Salva le modifiche sul database
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
	
	public synchronized ImmagineBean doRetrieveByKey(String nomecategoria) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ImmagineBean bean = new ImmagineBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE nome_immagine = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nomecategoria);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				bean.setNome_immagine(rs.getString("nome_immagine"));
				bean.setPath(rs.getString("path"));
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
	
	
}
