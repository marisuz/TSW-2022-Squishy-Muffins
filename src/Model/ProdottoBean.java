package Model;

public class ProdottoBean {
	
	int codprodotto;
	String Nome;
	int Prezzo;
	String Descrizione;
	ImmagineBean Immagine;
	int Rimosso;
	CategoriaBean Categoria;
	int Quantita;
	
	
	public int getCodprodotto() {
		return codprodotto;
	}
	public void setCodprodotto(int codprodotto) {
		this.codprodotto = codprodotto;
	}
	public CategoriaBean getCategoria() {
		return Categoria;
	}
	public void setCategoria(CategoriaBean categoria) {
		Categoria = categoria;
	}
	public int getQuantita() {
		return Quantita;
	}
	public void setQuantita(int quantita) {
		Quantita = quantita;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public int getPrezzo() {
		return Prezzo;
	}
	public void setPrezzo(int prezzo) {
		Prezzo = prezzo;
	}
	public String getDescrizione() {
		return Descrizione;
	}
	public void setDescrizione(String descrizione) {
		Descrizione = descrizione;
	}
	public ImmagineBean getImmagine() {
		return Immagine;
	}
	public void setImmagine(ImmagineBean immagine) {
		Immagine = immagine;
	}
	public int getRimosso() {
		return Rimosso;
	}
	public void setRimosso(int rimosso) {
		Rimosso = rimosso;
	}
	public ProdottoBean() {
		super();
	}
	
}
