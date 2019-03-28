package com.packt.webstore.validator;

import com.packt.webstore.domain.Product;
import com.packt.webstore.exception.ProductNotFoundException;
import com.packt.webstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.ArrayList;
import java.util.List;

@Component
public class CategoryValidator implements ConstraintValidator<Category, String> {
    private List<String> allowedCategories;

    public CategoryValidator() {
        allowedCategories = new ArrayList<>();

        allowedCategories.add("Smart Phone");
        allowedCategories.add("Laptop");
        allowedCategories.add("Tablet");
    }

    @Override
    public void initialize(Category constraintAnnotation) {
        // intentionally left blank; this is the place to initialize the constraint annotation for any sensible default values.
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {

        boolean valid = false;

        for (String category : allowedCategories) {
            if(category.equals(value)) {
                valid = true;
            }
        }

        return valid;
    }
}
