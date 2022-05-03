package com.example.biteltest2022.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "tbl_cart")
public class Cart {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @OneToOne
    @JoinColumn(name = "id_user")
    private User user;

    @OneToMany( cascade=CascadeType.ALL, mappedBy = "cart")
    private List<Item> items;

    public Cart() {
    }

    public Cart(User user, List<Item> items) {
        this.user = user;
        this.items = items;
    }

    public Cart(User user) {
        this.user = user;
    }

    public Cart(Integer id, User user, List<Item> items) {
        this.id = id;
        this.user = user;
        this.items = items;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
}
