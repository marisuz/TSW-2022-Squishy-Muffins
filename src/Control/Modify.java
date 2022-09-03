package Control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.ImmagineDAO;
import Model.ProdottoBean;
import Model.ProdottoDAO;

/**
 * Servlet implementation class Modify
 */
@WebServlet("/Modify")
@MultipartConfig
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "images";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modify() {
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
			if(action.equalsIgnoreCase("mod")) {
				int var =Integer.parseInt(request.getParameter("id"));
				try {
					ProdottoBean obj = pdao.doRetrieveByKey(var);					
					request.setAttribute("modify", obj);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Modify.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}
			
			if(action.equalsIgnoreCase("update")) {
				
				ProdottoBean obj = null;
				try {
					obj = pdao.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
				} catch (NumberFormatException | SQLException e1) {
					e1.printStackTrace();
				}
				obj.setNome((String) request.getParameter("Nome"));
				obj.setPrezzo(Float.parseFloat(request.getParameter("Prezzo")));
				obj.setDescrizione((String) request.getParameter("Descrizione"));
				obj.setQuantita(Integer.parseInt(request.getParameter("Quantità")));
				
				Part var = request.getPart("Immagine");
				System.out.println(GetFileName(var).equalsIgnoreCase(""));
				
				if(!GetFileName(var).equalsIgnoreCase("")) {
					
					ImmagineDAO IMDAO = new ImmagineDAO();
					System.out.println(GetFileName(var));
					try {
						obj.setImmagine(IMDAO.doRetrieveByKey(GetFileName(var)));
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				obj.setRimosso(Integer.parseInt(request.getParameter("Rimosso")));
				
				try {
					pdao.doUpdate(obj);
					if(!GetFileName(var).equalsIgnoreCase(""))
					saveFile(var, getServletContext().getRealPath(""));
				} catch (SQLException e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CatalogAdmin.jsp");
				dispatcher.forward(request, response);
				
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
	
	private String GetFileName(Part part)
    {
        for (String content : part.getHeader("content-disposition").split(";")) 
        {
            if (content.trim().startsWith("filename")) {
            	content = content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            	
            	return content.substring(0, content.length() - 4);
            }
        }
        return null;
    }
	
	private void saveFile(Part filePart, String appPath) throws IOException
    {
        final String fileName = GetFileName(filePart);

        if(fileName.isBlank() || fileName.isEmpty())
        {
            return;
        }

        String savePath = appPath + File.separator + SAVE_DIR;
        String savePathStore= "C:\\Immagini";

        OutputStream out = null;
        InputStream filecontent = null;

        try 
        {
            out = new FileOutputStream(new File(savePath + File.separator + fileName));//accesso negato qui
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) 
            {
                out.write(bytes, 0, read);
            }

            out.close();
            filecontent.close();

            out = new FileOutputStream(new File(savePathStore + File.separator + fileName));
            filecontent = filePart.getInputStream();

            read = 0;

            while ((read = filecontent.read(bytes)) != -1) 
            {
                out.write(bytes, 0, read);
            }
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
