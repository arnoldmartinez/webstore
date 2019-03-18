package com.packt.webstore.domain;

import com.packt.webstore.validator.Category;
import com.packt.webstore.validator.ProductId;
import lombok.Data;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
@XmlRootElement
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	@ProductId
    @Pattern(regexp="P[0-9]+", message="{Pattern.Product.productId.validation}")
    private String productId;

    @Size(min = 4, max = 50, message = "{Size.Product.name.validation}")
    private String name;

    @Min(value = 0, message = "{Min.Product.unitPrice.validation}")
    @Digits(integer = 8, fraction = 2, message = "{Digits.Product.unitPrice.validation}")
    @NotNull(message = "{NotNull.Product.unitPrice.validation}")
    private BigDecimal unitPrice;

    private String description;
    private String manufacturer;

    @Category
    @NotEmpty(message = "{NotEmpty.Product.category.validation}")
    private String category;

    @Min(value = 0, message = "{Min.Product.unitsInStock.validation}")
    private long unitsInStock;
    private long unitInOrder;
    private boolean discontinued;
    private String condition;

    @JsonIgnore
    private MultipartFile productImage;

    @JsonIgnore
    private MultipartFile productPDF;

    public Product() {
        super();
    }

    public Product(String productId, String name, BigDecimal unitPrice) {
        this.productId = productId;
        this.name = name;
        this.unitPrice = unitPrice;
    }

    @XmlTransient
    public MultipartFile getProductImage() {
        return productImage;
    }

    @XmlTransient
    public MultipartFile getProductPDF() {
        return productPDF;
    }
}
