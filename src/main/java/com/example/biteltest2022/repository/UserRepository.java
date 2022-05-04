package com.example.biteltest2022.repository;

import com.example.biteltest2022.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    @Override
    User getById(Integer integer);
    User getUsersByUserNameAndPassWord(String useName, String pass);
}
