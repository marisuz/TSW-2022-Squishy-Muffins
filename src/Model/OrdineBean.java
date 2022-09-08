package Model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

public class OrdineBean {
	
	PagamentoBean codPagamento;
	ConsegnaBean codConsegna;
	UtenteBean codUtente;
	int idOrdine;
	Date data_ordine;
	String stato_ordine;
	HashMap<ProdottoBean, ArrayList<Double>> composizione = new HashMap<>();  // Posizione 0 ci mettiamo quantità, Posizione 1 ci mettiamo Iva, Posizione 2 ci mettiamo Prezzo
	Double Prezzo_totale;
	
	//come gestiamo l'iva: insieme al prodotto salvato, salviamo anche la quantità, l'iva ed il prezzo al momento dell'acquisto
	
	
	public Double getPrezzo_totale() {
		return Prezzo_totale;
	}
	public void setPrezzo_totale(Double prezzo_totale) {
		Prezzo_totale = prezzo_totale;
	}
	
	public HashMap<ProdottoBean, ArrayList<Double>> getComposizione() {
		return composizione;
	}
	public void setComposizione(HashMap<ProdottoBean, ArrayList<Double>> composizione) {
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
