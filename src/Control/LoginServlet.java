package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.ResponseStatusMessage;
import Model.UtenteBean;
import Model.UtenteDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String contentType = "application/json; charset=UTF-8";
    private Gson gson = new Gson();
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	   if ( request.getHeader("x-requested-with") == null) {
    		   response.sendError(500);
    		   return;
    	   }
    	   response.setContentType(contentType);
    	   super.service(request, response);
       }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UtenteDAO users = new UtenteDAO();
		UtenteBean variabile = new UtenteBean();
		
		try {
			variabile = users.doRetrieveByKey(username);
			if (variabile == null) {
				String risposta = "Email no DB";
				response.getWriter().print(gson.toJson(new ResponseStatusMessage(200, risposta)));
				response.getWriter().flush();
				response.setStatus(200);
				return;
			} else if(variabile != null && !variabile.getPassword().equals(password)){
				String risposta = "Password no";
				response.getWriter().print(gson.toJson(new ResponseStatusMessage(200, risposta)));
				response.getWriter().flush();
				response.setStatus(200);
				return;
			} else {
				String risposta = "email e psw si";
				response.getWriter().print(gson.toJson(new ResponseStatusMessage(200, risposta)));
				response.getWriter().flush();
				response.setStatus(200);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.setStatus(500);
			response.getWriter().print(gson.toJson(new ResponseStatusMessage(500, "error")));
			response.getWriter().flush();
			return;
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
