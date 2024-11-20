/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import drinks.DrinksDTO;
import java.util.HashMap;
import java.util.Map;


/**
 *
 * @author BaoDinh
 */
public class Cart {
    private Map<String, DrinksDTO> cart;

    public Cart() {
    }
    public Cart(Map<String, DrinksDTO> cart) {
        this.cart = cart;
    }
    
    public Map<String, DrinksDTO> getCart() {
        return cart;
    }
    public void setCart(Map<String, DrinksDTO> cart) {
        this.cart = cart;
    }
    
    //--------------------------------------------------------------------------
     public boolean add(DrinksDTO drinks) {
        boolean check = false;
        if(this.cart== null){
            this.cart= new HashMap<>();
        }
        if (this.cart.containsKey(drinks.getId())) {
            int currentQuantity = this.cart.get(drinks.getId()).getQuantity();
            drinks.setQuantity(currentQuantity + drinks.getQuantity());
        }
        this.cart.put(drinks.getId(), drinks);
        
        check=true;
        return check;
    }
    
    public boolean edit(String id, DrinksDTO tea){
        boolean check = false;
        try {
            if(this.cart != null){
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, tea);
                    check = true;
                }
            }
        } catch (Exception e) {
        }
        
        return check;
    }
    public boolean remove(String id){
        boolean check = false;
        try {
            if(this.cart != null){
                if(this.cart.containsKey(id)){
                    this.cart.remove(id);
                    check=true;
                }
            }
        } catch (Exception e) {
        }
        return check;
    }
}
