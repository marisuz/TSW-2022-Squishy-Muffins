package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.OrdineBean;
import Model.OrdineDAO;

/**
 * Servlet implementation class Ordine
 */
@WebServlet("/Mostra_ordini")
public class Mostra_ordini extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mostra_ordini() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrdineDAO odao = new OrdineDAO();
		ArrayList<OrdineBean> var = null;  
		String action = request.getParameter("action");
		
		if(action.equals("mostra")) {
			try {
				var = (ArrayList<OrdineBean>) odao.doRetrieveAll(null);
				request.setAttribute("ordini", var);
				RequestDispatcher rs = request.getRequestDispatcher("profilo_admin.jsp");
				rs.include(request, response);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(action.equals("data")) {
			
			try {
				var = (ArrayList<OrdineBean>) odao.doRetrieveAll("data_ordine");
				request.setAttribute("ordini", var);
				RequestDispatcher rs = request.getRequestDispatcher("profilo_admin.jsp");
				rs.include(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			
			
		}else if(action.equals("utente")) {
			
			try {
				var = (ArrayList<OrdineBean>) odao.doRetrieveAll("cod_utente");
				request.setAttribute("ordini", var);
				RequestDispatcher rs = request.getRequestDispatcher("profilo_admin.jsp");
				rs.include(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
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

}
