package com.packt.webstore.repository;

import com.packt.webstore.domain.Customer;

import java.util.List;

public interface CustomerRepository {

    List<Customer> getAllCustomer();

}
