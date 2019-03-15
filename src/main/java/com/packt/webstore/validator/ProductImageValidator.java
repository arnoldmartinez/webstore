package com.packt.webstore.validator;

import com.packt.webstore.domain.Product;
import lombok.Setter;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class ProductImageValidator implements Validator {

    @Setter
    private long allowedSize;

    @Override
    public boolean supports(Class<?> clazz) {
        return Product.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Product product = (Product) target;

        if(product.getProductImage().getSize() > allowedSize) {
            errors.rejectValue("productImage", "com.packt.webstore.validator.ProductImageValidator.message");
        }
    }
}
