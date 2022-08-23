package Model;

import java.util.HashMap;
import java.util.Map;

public class Carrello {

	Map<Integer, Integer> cart = null;

	public Carrello() {
		super();
		this.cart = new HashMap<Integer, Integer>();
	}
	
	
	public void addToCart(Integer id, Integer qnt) {
		
		this.cart.put(id, qnt);
	}
	
	public void updateCart(Integer id, Integer qnt) {
		
		if(qnt.intValue() == 0) {
			
			this.cart.remove(id);
		}
		else {
			
			this.cart.replace(id, qnt);
		}
	}


	public Map<Integer, Integer> getCart() {
		return cart;
	}
}
