package com.example.biteltest2022.model;

import javax.persistence.*;

@Entity
@Table(name = "tbl_cart")
public class Cart {
    @Id
    @Column(name = "id")
    private Integer id;

    @OneToOne
    @JoinColumn(name = "id_user")
    private User user;

    @OneToOne
    @JoinColumn(name = "id_item")
    private Item item;

    public Cart() {
    }

    public Cart(Integer id, User user, Item item) {
        this.id = id;
        this.user = user;
        this.item = item;
    }

    public Cart(User user, Item item) {

        this.user = user;
        this.item = item;
    }

}
