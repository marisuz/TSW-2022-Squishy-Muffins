package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProdottoBean;
import Model.ProdottoDAO;
import Model.UtenteBean;
import Model.UtenteDAO;

/**
 * Servlet implementation class Mod_utente
 */
@WebServlet("/Mod_utente")
public class Mod_utente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mod_utente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UtenteDAO udao = new UtenteDAO();
		
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("update")) {
			
			try {
				UtenteBean obj = udao.doRetrieveByKey(request.getParameter("Email_vecchia"));
				obj.setEmail(request.getParameter("Email_nuova"));
				obj.setPassword(request.getParameter("Password"));
				obj.setNome(request.getParameter("Nome"));
				obj.setCognome(request.getParameter("Cognome"));
				obj.setCodice_fiscale(request.getParameter("CodiceFiscale"));
				udao.doUpdate(obj, request.getParameter("Email_vecchia"));
				request.getSession().setAttribute("Utente loggato", obj);
				response.sendRedirect("./Profilo_utente.jsp");
				
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
