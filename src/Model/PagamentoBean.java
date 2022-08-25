package Model;

public class PagamentoBean {
	
	int idpagamento;
	String Nominativo;
	int CVV;
	int meseScadenza;
	String Codice_carta;
	int annoScadenza;
	
	
	public int getIdpagamento() {
		return idpagamento;
	}
	public void setIdpagamento(int idpagamento) {
		this.idpagamento = idpagamento;
	}
	public String getNominativo() {
		return Nominativo;
	}
	public void setNominativo(String nominativo) {
		Nominativo = nominativo;
	}
	public int getCVV() {
		return CVV;
	}
	public void setCVV(int cVV) {
		CVV = cVV;
	}
	public int getMeseScadenza() {
		return meseScadenza;
	}
	public void setMeseScadenza(int meseScadenza) {
		this.meseScadenza = meseScadenza;
	}
	public String getCodice_carta() {
		return Codice_carta;
	}
	public void setCodice_carta(String codice_carta) {
		Codice_carta = codice_carta;
	}
	public int getAnnoScadenza() {
		return annoScadenza;
	}
	public void setAnnoScadenza(int annoScadenza) {
		this.annoScadenza = annoScadenza;
	}
	
	public PagamentoBean() {
		super();
	}
}
