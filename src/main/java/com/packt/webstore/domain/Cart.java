package com.packt.webstore.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@Data
public class Cart {

    @Getter @Setter private String cartId;

    @Getter @Setter private Map<String, CartItem> cartItems;

    @Getter
    private BigDecimal grandTotal;

    public Cart() {
        cartItems = new HashMap<String, CartItem>();
        grandTotal = new BigDecimal(0);
    }

    public Cart(String cartId) {
        this();
        this.cartId = cartId;
    }

    public void addCartItem(CartItem item) {
        String productId = item.getProduct().getProductId();

        if(cartItems.containsKey(productId)) {
            CartItem existingCartItem = cartItems.get(productId);
            existingCartItem.setQuantity(existingCartItem.getQuantity() + item.getQuantity());

            cartItems.put(productId, existingCartItem);
        } else {
            cartItems.put(productId, item);
        }
        updateGrandTotal();
    }

    public void removeCartItem(CartItem item) {
        String productId = item.getProduct().getProductId();

        cartItems.remove(productId);

        updateGrandTotal();
    }

    public void updateGrandTotal() {
        grandTotal = new BigDecimal(0);

        for(CartItem item : cartItems.values()) {
            grandTotal = grandTotal.add(item.getTotalPrice());
        }
    }
}
