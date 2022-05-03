package com.example.biteltest2022;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootTest
@EnableJpaRepositories(basePackages = "repository")
class BitelTest2022ApplicationTests {

    @Test
    void contextLoads() {
    }

}
