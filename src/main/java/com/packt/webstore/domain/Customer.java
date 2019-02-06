package com.packt.webstore.domain;

import lombok.Data;

@Data
public class Customer {

    private String customerId;
    private String name;
    private String address;
    private long noOfOrdersMade;

}
