package com.example.biteltest2022.repository;

import com.example.biteltest2022.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartRepository extends JpaRepository<Cart,Integer> {
    @Query("from Cart c where c.user.id = ?1 ")
    List<Cart> getCartsByUser(Integer id);
}
