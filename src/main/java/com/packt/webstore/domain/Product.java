package com.packt.webstore.domain;

import lombok.Data;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.math.BigDecimal;

@Data
@XmlRootElement
public class Product {

    private String productId;
    private String name;
    private BigDecimal unitPrice;
    private String description;
    private String manufacturer;
    private String category;
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
