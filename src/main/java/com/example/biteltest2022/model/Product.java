package com.example.biteltest2022.model;


import javax.persistence.*;

@Entity
@Table(name = "tbl_product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;
    @Column(name = "n_name")
    private String name;
    @Column(name = "n_short_des")
    private String shortDes;
    @Column(name = "n_detail_des")
    private String detailDes;
    @Column(name = "n_price")
    private float price;
    @Column(name = "n_img_url")
    private String imgUrl;

//    @ManyToOne
//    @JoinColumn(name = "user_id")
//    private User user;



    public Product(Integer id, String name, User user) {
        this.id = id;
        this.name = name;
    }

    public Product(String name, String shortDes, String detailDes, float price, String imgUrl, User user) {
        this.name = name;
        this.shortDes = shortDes;
        this.detailDes = detailDes;
        this.price = price;
        this.imgUrl = imgUrl;
    }



    public Product() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }

    public String getDetailDes() {
        return detailDes;
    }

    public void setDetailDes(String detailDes) {
        this.detailDes = detailDes;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", shortDes='" + shortDes + '\'' +
                ", detailDes='" + detailDes + '\'' +
                ", price=" + price +
                ", imgUrl='" + imgUrl + '\'' +
                '}';
    }
}
