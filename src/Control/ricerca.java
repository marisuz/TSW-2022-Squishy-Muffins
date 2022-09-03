package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.ProdottoBean;
import Model.ProdottoDAO;

/**
 * Servlet implementation class ricerca
 */
@WebServlet("/ricerca")
public class ricerca extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String contentType = "application/json; charset=UTF-8";
    private String action;
    private Gson gson = new Gson();
	protected void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	   if ( request.getHeader("x-requested-with") == null) {
    		   response.sendError(500);
    		   return;
    	   }
    	   this.action = request.getParameter("action");
    	   response.setContentType(contentType);
    	   super.service(request, response);
       }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ricerca() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (action.equalsIgnoreCase("search") ) {
			ProdottoDAO pdao = new ProdottoDAO();
			ArrayList <ProdottoBean> elenco = new ArrayList<>();
			try {
				elenco = (ArrayList<ProdottoBean>) pdao.doRetrieveLike(request.getParameter("prodotto"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
