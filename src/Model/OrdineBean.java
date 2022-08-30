package Model;

import java.sql.Date;
import java.util.HashMap;

public class OrdineBean {
	
	PagamentoBean codPagamento;
	ConsegnaBean codConsegna;
	UtenteBean codUtente;
	int idOrdine;
	Date data_ordine;
	String stato_ordine;
	HashMap<ProdottoBean, Integer> composizione = new HashMap<>();
	
	
	public HashMap<ProdottoBean, Integer> getComposizione() {
		return composizione;
	}
	public void setComposizione(HashMap<ProdottoBean, Integer> composizione) {
		this.composizione = composizione;
	}
	
	public PagamentoBean getCodPagamento() {
		return codPagamento;
	}
	public void setCodPagamento(PagamentoBean codPagamento) {
		this.codPagamento = codPagamento;
	}
	public ConsegnaBean getCodConsegna() {
		return codConsegna;
	}
	public void setCodConsegna(ConsegnaBean codConsegna) {
		this.codConsegna = codConsegna;
	}
	public UtenteBean getCodUtente() {
		return codUtente;
	}
	public void setCodUtente(UtenteBean codUtente) {
		this.codUtente = codUtente;
	}
	public int getIdOrdine() {
		return idOrdine;
	}
	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}
	public Date getData_ordine() {
		return data_ordine;
	}
	public void setData_ordine(Date data_ordine) {
		this.data_ordine = data_ordine;
	}
	public String getStato_ordine() {
		return stato_ordine;
	}
	public void setStato_ordine(String stato_ordine) {
		this.stato_ordine = stato_ordine;
	}
	
	public OrdineBean() {
		super();
	}
	
	
}
