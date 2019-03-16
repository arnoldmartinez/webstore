package com.packt.webstore.domain;

import lombok.Data;
import lombok.Getter;

import java.math.BigDecimal;

@Data
public class CartItem {

    @Getter
    private Product product;

    @Getter
    private int quantity;

    @Getter
    private BigDecimal totalPrice;

    public CartItem() {
        // TODO Auto-generated constructor stub
    }

    public CartItem(Product product) {
        super();
        this.product = product;
        this.quantity = 1;
        this.totalPrice = product.getUnitPrice();
    }

    public void setProduct(Product product) {
        this.product = product;
        this.updateTotalPrice();
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.updateTotalPrice();
    }

    public void updateTotalPrice() {
        totalPrice = this.product.getUnitPrice().multiply(new BigDecimal(this.quantity));
    }
}
