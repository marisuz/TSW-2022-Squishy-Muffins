package Model;

public class UtenteBean {
	
	String Email;
	String Password;
	String Nome;
	String Cognome;
	String Codice_fiscale;
	Boolean admin;
	
	public Boolean isAdmin() {
		return admin;
	}
	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
	public String getCodice_fiscale() {
		return Codice_fiscale;
	}
	public void setCodice_fiscale(String codice_fiscale) {
		Codice_fiscale = codice_fiscale;
	}
	//Getter e Setters
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getCognome() {
		return Cognome;
	}
	public void setCognome(String cognome) {
		Cognome = cognome;
	}
	
	//Costruttore UtenteBean
	public UtenteBean() {
		super();
	}
	

	
	
	
	
}