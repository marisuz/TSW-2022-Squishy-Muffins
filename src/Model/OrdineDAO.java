package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

public class OrdineDAO {
	
	private static final String TABLE_NAME = "ordine";
	
	public synchronized int doSave(OrdineBean user) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String ID = "SELECT id_ordine FROM squishy_muffins.ordine ORDER BY id_ordine DESC LIMIT 1";
		

		String insertSQL = "INSERT INTO " + OrdineDAO.TABLE_NAME
					+ " (id_ordine, data_ordine, stato_ordine, cod_consegna, cod_pagamento, cod_utente, prezzo_totale)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?)";

		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			
			PreparedStatement query = connection.prepareStatement(ID);
			
			ResultSet id = query.executeQuery();
			
			id.next();
			int CID = id.getInt("id_ordine") + 1;
			
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, CID);
			preparedStatement.setDate(2, user.getData_ordine());
			preparedStatement.setString(3, user.getStato_ordine());
			preparedStatement.setInt(4, user.getCodConsegna().getIdconsegna());
			preparedStatement.setInt(5, user.getCodPagamento().getIdpagamento());
			preparedStatement.setString(6, user.getCodUtente().getEmail());
			preparedStatement.setDouble(7, user.getPrezzo_totale());
	
			preparedStatement.executeUpdate();
			return CID;
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
	
	public synchronized OrdineBean doRetrieveByKey(int idordine) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		OrdineBean bean = new OrdineBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id_ordine = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idordine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				bean.setIdOrdine(rs.getInt("id_ordine"));
				bean.setData_ordine(rs.getDate("data_ordine"));
				bean.setStato_ordine(rs.getString("stato_ordine"));
				bean.setPrezzo_totale(rs.getDouble("prezzo_totale"));
				
				ConsegnaDAO cdao = new ConsegnaDAO();
				ConsegnaBean cbean = cdao.doRetrieveByKey(rs.getInt("cod_consegna"));
				bean.setCodConsegna(cbean);
				
				PagamentoDAO pdao = new PagamentoDAO();
				PagamentoBean pbean = pdao.doRetrieveByKey(rs.getInt("cod_pagamento"));
				bean.setCodPagamento(pbean);
				
				UtenteDAO udao = new UtenteDAO();
				UtenteBean ubean = udao.doRetrieveByKey(rs.getString("cod_utente"));
				bean.setCodUtente(ubean);
				
				ComposizioneDAO codao = new ComposizioneDAO();
				bean.setComposizione(codao.doRetrieveByOrdine(rs.getInt("id_ordine")));
				
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
	
	public synchronized boolean doDelete(int idordine) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + OrdineDAO.TABLE_NAME + " WHERE id_ordine = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, idordine);

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
	
	public synchronized void doUpdate (OrdineBean var) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String upsql = "UPDATE " + OrdineDAO.TABLE_NAME + 
						" SET data_ordine = ?, stato_ordine = ?, cod_consegna = ?, cod_pagamento = ?, cod_utente = ?, prezzo_totale = ? " + 
						"WHERE id_ordine = ?";
		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(upsql);
			
			preparedStatement.setDate(1, var.getData_ordine());
			preparedStatement.setString(2, var.getStato_ordine());
			preparedStatement.setInt(3, var.getCodConsegna().getIdconsegna());
			preparedStatement.setInt(4, var.getCodPagamento().getIdpagamento());
			preparedStatement.setString(5, var.getCodUtente().getEmail());
			preparedStatement.setDouble(6, var.getPrezzo_totale());
			
			preparedStatement.executeUpdate();
			//connection.commit();

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
	
	public synchronized Collection<OrdineBean> doRetrieveAll(String var) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrdineBean> order = new ArrayList<OrdineBean>();
		
		String selectSQL = "SELECT * FROM " + OrdineDAO.TABLE_NAME;
		
		if (var != null && !var.equals("")) 
		{
			selectSQL += " ORDER BY " + var;
		}

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				OrdineBean bean = new OrdineBean();

				bean.setIdOrdine(rs.getInt("id_ordine"));
				bean.setData_ordine(rs.getDate("data_ordine"));
				bean.setStato_ordine(rs.getString("stato_ordine"));
				bean.setPrezzo_totale(rs.getDouble("prezzo_totale"));
				
				ConsegnaDAO cdao = new ConsegnaDAO();
				ConsegnaBean cbean = cdao.doRetrieveByKey(rs.getInt("cod_consegna"));
				bean.setCodConsegna(cbean);
				
				PagamentoDAO pdao = new PagamentoDAO();
				PagamentoBean pbean = pdao.doRetrieveByKey(rs.getInt("cod_pagamento"));
				bean.setCodPagamento(pbean);
				
				UtenteDAO udao = new UtenteDAO();
				UtenteBean ubean = udao.doRetrieveByKey(rs.getString("cod_utente"));
				bean.setCodUtente(ubean);
				
				ComposizioneDAO codao = new ComposizioneDAO();
				bean.setComposizione(codao.doRetrieveByOrdine(rs.getInt("id_ordine")));
				
				order.add(bean);
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
		return order;
		
		
		
		
	}
	
public synchronized Collection<OrdineBean> doRetrieveAllByUtente(String var) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrdineBean> order = new ArrayList<OrdineBean>();
		
		String selectSQL = "SELECT * FROM " + OrdineDAO.TABLE_NAME + " WHERE cod_utente = ?";
		
		
		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, var);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				OrdineBean bean = new OrdineBean();

				bean.setIdOrdine(rs.getInt("id_ordine"));
				bean.setData_ordine(rs.getDate("data_ordine"));
				bean.setStato_ordine(rs.getString("stato_ordine"));
				bean.setPrezzo_totale(rs.getDouble("prezzo_totale"));
				
				ConsegnaDAO cdao = new ConsegnaDAO();
				ConsegnaBean cbean = cdao.doRetrieveByKey(rs.getInt("cod_consegna"));
				bean.setCodConsegna(cbean);
				
				PagamentoDAO pdao = new PagamentoDAO();
				PagamentoBean pbean = pdao.doRetrieveByKey(rs.getInt("cod_pagamento"));
				bean.setCodPagamento(pbean);
				
				UtenteDAO udao = new UtenteDAO();
				UtenteBean ubean = udao.doRetrieveByKey(rs.getString("cod_utente"));
				bean.setCodUtente(ubean);
				
				ComposizioneDAO codao = new ComposizioneDAO();
				bean.setComposizione(codao.doRetrieveByOrdine(rs.getInt("id_ordine")));
				
				order.add(bean);
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
		return order;
		
		
		
		
	}
	
	
}
