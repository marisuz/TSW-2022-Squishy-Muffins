package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoriaDAO {
	
	private static final String TABLE_NAME = "categoria";
	
	public synchronized CategoriaBean doRetrieveByKey(int codcategoria) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		CategoriaBean bean = new CategoriaBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE cod_categoria = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, codcategoria);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				bean.setCodcategoria(rs.getInt("cod_categoria"));
				bean.setNome(rs.getString("nome"));
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
