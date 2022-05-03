package com.example.biteltest2022.repository;

import com.example.biteltest2022.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

@org.springframework.stereotype.Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
}
