package Control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProdottoBean;
import Model.ProdottoDAO;

/**
 * Servlet implementation class Catalogo
 */
@WebServlet("/Catalogo")
public class Catalogo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init(ServletConfig config) throws ServletException 
    {
        super.init(config);
        try 
        {
            LoadImage();
        }
        catch (IOException e) 
        {
            e.printStackTrace();
        }
    }
	
    public Catalogo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProdottoDAO pdao = new ProdottoDAO();
		
		String action = request.getParameter("action");
		if(action != null) {
			if(action.equalsIgnoreCase("read")) {
				try {
					Collection<ProdottoBean> obj = pdao.doRetrieveAll(null);		// Siccome la funzione doRetrieveAll istanzia già un oggetto di Collection<ProdottoBean> è inutile  istanziarlo
					request.setAttribute("prodotti", obj); 
					
					String secure = (String) request.getSession().getAttribute("secure");
				if(secure == null || secure.equalsIgnoreCase("Utente")) {
					RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/Catalog.jsp");
					dispatcher.forward(request, response);
					return;
					}
					if(secure.equalsIgnoreCase("Admin")) {
						RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/CatalogAdmin.jsp");
						dispatcher.forward(request, response);
						return;
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				
			}
			if(action.equalsIgnoreCase("view")) {
				int var =Integer.parseInt(request.getParameter("id"));
				
				try {
					ProdottoBean obj = pdao.doRetrieveByKey(var);
					request.setAttribute("description", obj);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Description.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void LoadImage() throws IOException
    {
        String savePath = getServletContext().getRealPath("") + File.separator + "images/";

        File folder = new File("C:/Immagini");
        File[] listOfFiles = folder.listFiles();

        OutputStream out = null;
        InputStream filecontent = null;

        for (int i = 0; i < listOfFiles.length; i++) 
        {
            if (listOfFiles[i].isFile()) 
            {
                try 
                {
                    out = new FileOutputStream(new File(savePath + File.separator + listOfFiles[i].getName()));
                    filecontent = new FileInputStream(listOfFiles[i]);

                    int read = 0;
                    final byte[] bytes = new byte[1024];

                    while ((read = filecontent.read(bytes)) != -1) 
                    {
                        out.write(bytes, 0, read);
                    }

                    out.close();
                    filecontent.close();
                } 
                catch (Exception e) 
                {
                    System.out.println("Error:" + e.getMessage());
                    throw new IOException(e);
                } 
                finally 
                {
                    if (out != null)
                    {
                        out.close();
                    }
                    if (filecontent != null) 
                    {
                        filecontent.close();
                    }
                }
            } 
        }
    }

}
