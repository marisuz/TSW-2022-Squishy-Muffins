package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Carrello;
import Model.ProdottoBean;
import Model.ProdottoDAO;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Carrello obj = (Carrello) request.getSession().getAttribute("carrello");
		if(obj == null) {
			
			obj = new Carrello();
			request.getSession().setAttribute("carrello", obj);
		}
		String action = request.getParameter("action");
		if(action != null) {
			if(action.equalsIgnoreCase("add")) {
				
				Integer id, qnt;
				id = Integer.parseInt(request.getParameter("id"));
				qnt = Integer.parseInt(request.getParameter("qnt"));
				
				if(qnt == 0) {
					obj.updateCart(id, 0); // Se la quantità che viene inserita sarà ugugale a 0 verrà implciata la sua eliminazione
				}
				
				// Se l'oggetto esiste allora sarà una modifica del carrello fatta da catalogo, cambiando la quantità 
				if(obj.getCart().containsKey(id)) {
					
					obj.updateCart(id, qnt + obj.getCart().get(id));  // Siccome getCart.().get(id) fa riferimento al valore viene aggiornato il valore della quantità
				}
				else {
					obj.addToCart(id, qnt);
				}
				if(request.getParameter("provenienza").equals("carrello")) {
					request.getSession().setAttribute("carrello", obj); // Per evitare che il carrello non si aggiorni
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
					dispatcher.forward(request, response);
				}
				else {
					request.getSession().setAttribute("carrello", obj); // Per evitare che il carrello non si aggiorni
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Catalog.jsp");
					dispatcher.forward(request, response);
				}
			}
			
			if(action.equalsIgnoreCase("view")) {
				
				Map<ProdottoBean, Integer> ogg = new HashMap<>();
				ProdottoDAO pdao = new ProdottoDAO();
				
				for(Entry<Integer, Integer> entry : obj.getCart().entrySet()) {
					
					ProdottoBean var = new ProdottoBean();
					
					try {
						var = pdao.doRetrieveByKey(entry.getKey());
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					ogg.put(var, entry.getValue()); //Grazie alla funzione nel foreach riusciamo a visualizzare tutti quanti gli oggetti nella mappa facendo riferimento alla chiave con il suo valore ovvero la quantità
				}
				
				request.setAttribute("carrello_view", ogg);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
				dispatcher.forward(request, response);
			}
			
			if(action.equalsIgnoreCase("sub")) {
				
				Integer id, qnt, result;
				id = Integer.parseInt(request.getParameter("id"));
				qnt = Integer.parseInt(request.getParameter("qnt"));
				
				result = obj.getCart().get(id);
				result--;
				
				obj.updateCart(id, result);
				
				if(request.getParameter("provenienza").equals("carrello")) {
					
					request.getSession().setAttribute("carrello", obj);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
					dispatcher.forward(request, response);
					
				}
			}
			
			if(action.equalsIgnoreCase("rmv")) {
				
				Integer id, qnt;
				id = Integer.parseInt(request.getParameter("id"));
				
				qnt = 0;
				obj.updateCart(id, qnt);
				
				if(request.getParameter("provenienza").equals("carrello")) {
					
					request.getSession().setAttribute("carrello", obj);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
					dispatcher.forward(request, response);
				}
			}
			
			if(action.equalsIgnoreCase("rmvall")) {
				
				obj = new Carrello();
				
				if(request.getParameter("provenienza").equals("carrello")) {
					
					request.getSession().setAttribute("carrello", obj);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Carrello.jsp");
					dispatcher.forward(request, response);
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

}
