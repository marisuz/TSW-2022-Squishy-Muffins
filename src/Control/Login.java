package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UtenteBean;
import Model.UtenteDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Email;
		String Password;
		
		Email= request.getParameter("username");
		Password=request.getParameter("password");
		
		UtenteBean utente = new UtenteBean();
		UtenteDAO udao = new UtenteDAO();
		
		try {
			utente = udao.doRetrieveByKey(Email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(utente != null && utente.getEmail().compareTo("") != 0) {
			if(Password.compareTo(utente.getPassword()) == 0) {
				//response.getWriter().append("nome: " + utente.getNome() + "\ncognome: " + utente.getCognome());
				
				if(utente.isAdmin()) {
					request.getSession().setAttribute("secure", "Admin");
					request.getSession().setAttribute("Utente loggato" , utente );       //Per motivi di sicurezza 
					response.sendRedirect("./CatalogAdmin.jsp");
				}
				else {
					request.getSession().setAttribute("secure", "Utente");
					request.getSession().setAttribute("Utente loggato" , utente );       //Per motivi di sicurezza
					response.sendRedirect("./Catalog.jsp");
				}
				
				
			}
			else {
				response.getWriter().append("Password non corretta");
			}
		}
		else {
			response.getWriter().append("Utente non registrato");
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
