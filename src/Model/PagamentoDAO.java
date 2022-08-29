package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PagamentoDAO {
	
	private static final String TABLE_NAME = "metodo_pagamento";
	
	public synchronized  void doSave(PagamentoBean user) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String ID = "SELECT id_pagamento FROM squishy_muffins.metodo_pagamento ORDER BY id_pagamento DESC LIMIT 1";
		

		String insertSQL = "INSERT INTO " + PagamentoDAO.TABLE_NAME
					+ " (id_pagamento, nominativo, CVV, meseScadenza, codice_carta, annoScadenza)"
					+ " VALUES (?, ?, ?, ?, ?, ?)";

		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			
			PreparedStatement query = connection.prepareStatement(ID);
			
			ResultSet id = query.executeQuery();
			
			id.next();
			int CID = id.getInt("id_pagamento") + 1;
			
			
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, user.getIdpagamento());
			preparedStatement.setString(2, user.getNominativo());
			preparedStatement.setInt(3, user.getCVV());
			preparedStatement.setInt(4, user.getMeseScadenza());
			preparedStatement.setString(5, user.getCodice_carta());
			preparedStatement.setInt(5, user.getAnnoScadenza());
	
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
	
	public synchronized PagamentoBean doRetrieveByKey(int idpagamento) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		PagamentoBean bean = new PagamentoBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id_pagamento = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idpagamento);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				bean.setIdpagamento(rs.getInt("id_pagamento"));
				bean.setNominativo(rs.getString("nominativo"));
				bean.setCVV(rs.getInt("CVV"));
				bean.setMeseScadenza(rs.getInt("meseScadenza"));
				bean.setCodice_carta(rs.getString("codice_carta"));
				bean.setAnnoScadenza(rs.getInt("annoScadenza"));
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
	
	public synchronized boolean doDelete(int idpagamento) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + PagamentoDAO.TABLE_NAME + " WHERE id_pagamento = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, idpagamento);

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
