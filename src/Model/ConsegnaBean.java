package Model;

public class ConsegnaBean {
	
	int idconsegna;
	String Via;
	int Cap; 
	int Numero;
	String Citta;
	UtenteBean utente;
	
	
	public UtenteBean getUtente() {
		return utente;
	}
	public void setUtente(UtenteBean utente) {
		this.utente = utente;
	}
	
	public int getIdconsegna() {
		return idconsegna;
	}
	public void setIdconsegna(int idconsegna) {
		this.idconsegna = idconsegna;
	}
	public String getVia() {
		return Via;
	}
	public void setVia(String via) {
		Via = via;
	}
	public int getCap() {
		return Cap;
	}
	public void setCap(int cap) {
		Cap = cap;
	}
	public int getNumero() {
		return Numero;
	}
	public void setNumero(int numero) {
		Numero = numero;
	}
	public String getCitta() {
		return Citta;
	}
	public void setCitta(String citta) {
		Citta = citta;
	}
	
	public ConsegnaBean() {
		super();
	}
	
	
	
	
}
