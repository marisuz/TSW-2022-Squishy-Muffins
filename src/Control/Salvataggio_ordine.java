package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Carrello;
import Model.ComposizioneDAO;
import Model.ConsegnaDAO;
import Model.OrdineBean;
import Model.OrdineDAO;
import Model.PagamentoDAO;
import Model.ProdottoBean;
import Model.UtenteBean;

/**
 * Servlet implementation class Salvataggio_ordine
 */
@WebServlet("/Salvataggio_ordine")
public class Salvataggio_ordine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Salvataggio_ordine() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrdineDAO odao = new OrdineDAO();
		OrdineBean obj = new OrdineBean();
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		
		obj.setData_ordine(date);
		obj.setStato_ordine("In lavorazione");
		
		ConsegnaDAO cdao = new ConsegnaDAO();
		try {
			obj.setCodConsegna(cdao.doRetrieveByKey(Integer.parseInt(request.getParameter("Indirizzo"))));
			
			PagamentoDAO pdao = new PagamentoDAO();
			obj.setCodPagamento(pdao.doRetrieveByKey(Integer.parseInt(request.getParameter("Pagamento"))));
			
			UtenteBean ut = (UtenteBean)request.getSession().getAttribute("Utente loggato");
			obj.setCodUtente(ut);
			
			obj.setComposizione((HashMap <ProdottoBean, ArrayList<Double> >) request.getSession().getAttribute("carrello_view"));
			request.getSession().setAttribute("carrello_view", new HashMap<ProdottoBean,ArrayList<Double>>());
			request.getSession().setAttribute("carrello", new Carrello());
			
			obj.setIdOrdine(odao.doSave(obj));
			
			ComposizioneDAO cmdao = new ComposizioneDAO();
			cmdao.doSaveAll(obj);
			response.sendRedirect("Acquisto_completato.jsp");
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
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
