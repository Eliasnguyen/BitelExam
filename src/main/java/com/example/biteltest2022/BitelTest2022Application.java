package com.example.biteltest2022;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"controller"})
public class BitelTest2022Application {

    public static void main(String[] args) {
        SpringApplication.run(BitelTest2022Application.class, args);
    }

}
