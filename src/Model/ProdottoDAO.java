package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class ProdottoDAO
{
	private static final String TABLE_NAME = "prodotto";
	
	public synchronized  void doSave(ProdottoBean user) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String ID = "SELECT cod_prodotto FROM squishy_muffins.prodotto ORDER BY codprodotto DESC LIMIT 1";
		

		String insertSQL = "INSERT INTO " + ProdottoDAO.TABLE_NAME
					+ " (nome, prezzo, descrizione, quantita, codi_categoria)"
					+ " VALUES (?, ?, ?, ?)";

		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			
			PreparedStatement query = connection.prepareStatement(ID);
			
			ResultSet id = query.executeQuery();
			
			id.next();
			int CID = id.getInt("codprodotto") + 1;
			
			
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getNome());
			preparedStatement.setInt(2, user.getPrezzo());
			preparedStatement.setString(3, user.getDescrizione());
			preparedStatement.setInt(4, user.getQuantita());
			preparedStatement.setInt(5, user.getCategoria().getCodcategoria());
	
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
	
	public synchronized ProdottoBean doRetrieveByKey(int Idprodotto) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProdottoBean bean = new ProdottoBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE cod_prodotto = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, Idprodotto);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				bean.setCodprodotto(rs.getInt("cod_prodotto"));
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getInt("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setRimosso(rs.getInt("rimosso"));
				bean.setQuantita(rs.getInt("quantita"));
				
				ImmagineDAO pdao = new ImmagineDAO();
				bean.setImmagine(pdao.doRetrieveByKey(rs.getString("cod_immagine")));
				
				CategoriaDAO cdao = new CategoriaDAO();
				bean.setCategoria(cdao.doRetrieveByKey(rs.getInt("codi_categoria")));
				
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

	public synchronized boolean doDelete(int Idprodotto) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProdottoDAO.TABLE_NAME + " WHERE codprodotto = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, Idprodotto);

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

	public synchronized Collection<ProdottoBean> doRetrieveAll(String order) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProdottoBean> product = new LinkedList<ProdottoBean>();

		String selectSQL = "SELECT * FROM " + ProdottoDAO.TABLE_NAME;

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
				ProdottoBean bean = new ProdottoBean();

				bean.setCodprodotto(rs.getInt("cod_prodotto"));
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getInt("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				
				ImmagineDAO pdao = new ImmagineDAO();
				bean.setImmagine(pdao.doRetrieveByKey(rs.getString("cod_immagine")));
				
				CategoriaDAO cdao = new CategoriaDAO();
				bean.setCategoria(cdao.doRetrieveByKey(rs.getInt("codi_categoria")));
				
				bean.setQuantita(rs.getInt("quantita"));
				bean.setRimosso(rs.getInt("rimosso"));
				
				product.add(bean);
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
		return product;
	}
	
	public synchronized void doUpdate (ProdottoBean var) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String upsql = "UPDATE " + ProdottoDAO.TABLE_NAME + 
						" SET nome = ?, prezzo = ?, descrizione = ?, cod_immagine = ?, rimosso = ?, quantita = ?, codi_categoria = ?,  " + 
						"WHERE cod_prodotto = ?";
		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(upsql);
			
			preparedStatement.setString(1, var.getNome());
			preparedStatement.setInt(2, var.getPrezzo());
			preparedStatement.setString(3, var.getDescrizione());
			preparedStatement.setString(4, var.getImmagine().getNome_immagine());
			preparedStatement.setInt(5, var.getRimosso());
			
			preparedStatement.executeUpdate();
			connection.commit();

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
	
	}
