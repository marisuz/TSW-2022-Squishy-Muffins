package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class ComposizioneDAO {
	
	private static final String TABLE_NAME = "composizione";
	
	
	public synchronized  void doSaveAll(OrdineBean user) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " + ComposizioneDAO.TABLE_NAME
					+ " (codi_prodotto, num_ordine, quantita)"
					+ " VALUES (?, ?, ?)";

		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			
			for(ProdottoBean bean : user.getComposizione().keySet()){  // Per scorrere ogni singolo prodotto nella hashmap, utilizzo il for
				
				System.out.println("hello");
				
				preparedStatement = connection.prepareStatement(insertSQL);
				preparedStatement.setInt(1, bean.getCodprodotto());
				preparedStatement.setInt(2, user.getIdOrdine());
				preparedStatement.setInt(3, user.getComposizione().get(bean));		// Attraverso la chiave nel bean, prendo la quantità del prodotto nell'ordine
		
				preparedStatement.executeUpdate();
			}
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
	
	public synchronized HashMap<ProdottoBean, Integer> doRetrieveByOrdine(int idordine) throws SQLException			//La funzione mi riporta il prodotto con la sua quantità nell'ordine
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		HashMap<ProdottoBean, Integer> bean = new HashMap<>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE num_ordine = ?";

		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idordine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				
				ProdottoDAO pdao = new ProdottoDAO();
				bean.put(pdao.doRetrieveByKey(rs.getInt("codi_prodotto")), rs.getInt("quantita"));
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
