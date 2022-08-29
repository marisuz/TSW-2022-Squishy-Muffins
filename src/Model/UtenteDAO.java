package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class UtenteDAO
{
	private static final String TABLE_NAME = "utente";
	
	public synchronized  void doSave(UtenteBean user) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UtenteDAO.TABLE_NAME
					+ " (email, password, nome, cognome, codice_fiscale)"
					+ " VALUES (?, ?, ?, ?, ?)";

		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getNome());
			preparedStatement.setString(4, user.getCognome());
			preparedStatement.setString(5, user.getCodice_fiscale());
	
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
	
public synchronized void doUpdate (UtenteBean var, String vecchia_mail) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String upsql = "UPDATE " + UtenteDAO.TABLE_NAME + 
						" SET email = ?, password = ?, nome = ?, cognome = ?, codice_fiscale = ? " + 
						"WHERE (email = ?) ";
		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(upsql);
			
			preparedStatement.setString(1, var.getEmail());
			preparedStatement.setString(2, var.getPassword());
			preparedStatement.setString(3, var.getNome());
			preparedStatement.setString(4, var.getCognome());
			preparedStatement.setString(5, var.getCodice_fiscale());
			preparedStatement.setString(6, vecchia_mail);		// per sapere quale mail cambiare tenendo come riferimento quella vecchia durante la modifica
			
			preparedStatement.executeUpdate();
			

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
	
	
	public synchronized UtenteBean doRetrieveByKey(String Email) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		UtenteBean bean = new UtenteBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE email = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, Email);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setAdmin(rs.getBoolean("tipo_account"));
				bean.setCodice_fiscale(rs.getString("codice_fiscale"));
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

	public synchronized boolean doDelete(String Email) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + UtenteDAO.TABLE_NAME + " WHERE email = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, Email);

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

	public synchronized Collection<UtenteBean> doRetrieveAll(String order) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<UtenteBean> users = new LinkedList<UtenteBean>();

		String selectSQL = "SELECT * FROM " + UtenteDAO.TABLE_NAME;

		if (order != null && !order.equals("")) 
		{
			selectSQL += " ORDER BY " + order;
		}

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				UtenteBean bean = new UtenteBean();

				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setAdmin(rs.getBoolean("tipo_account"));
				bean.setCodice_fiscale(rs.getString("codice_fiscale"));
				
				users.add(bean);
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
		return users;
	}
	}
