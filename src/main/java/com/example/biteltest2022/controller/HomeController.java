package com.example.biteltest2022.controller;

import com.example.biteltest2022.model.Cart;
import com.example.biteltest2022.model.Item;
import com.example.biteltest2022.model.Product;
import com.example.biteltest2022.model.User;
import com.example.biteltest2022.repository.CartRepository;
import com.example.biteltest2022.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.example.biteltest2022.repository.ProductRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
@RequestMapping("/web")
public class HomeController {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    UserRepository userRepository;
    @Autowired
    CartRepository cartRepository;

    @GetMapping(value = "/hi")
    public String getAllCategories() {
        return "index";
    }
    @PostMapping(value = "/hi")
    public ModelAndView initIndex( @ModelAttribute("user") User user, HttpServletRequest request) {
        User gotuser = login(user);
        if(gotuser != null){
            List<Product> inst = productRepository.findAll();
            ModelAndView mav = new ModelAndView("products");
           mav.addObject("list", inst);
            HttpSession session = request.getSession();
            session.setAttribute("user", gotuser);
            session.setAttribute("listProduct",inst);
            return mav;
        }
        return new ModelAndView("index");

    }

    private User login( @ModelAttribute("user") User user) {
        User checkUser = userRepository.getUsersByUserNameAndPassWord(user.getUserName(), user.getPassWord());
        if (user != null && checkUser != null) {
            return checkUser;

        }  return null;
    }





    @RequestMapping(value = "/insert")
    public void insset(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = new Cart();
        cart.setUser(user);
        Map<Integer, Item> itemMap = (Map<Integer, Item>) session.getAttribute("cart");
        Set<Integer> keys = itemMap.keySet();
        List<Item> items = new ArrayList<>();
        for(Integer key:keys){
            Item item = itemMap.get(key);
            item.setCart(cart);
            items.add(item);
        }

        cart.setItems(items);
        cartRepository.save(cart);
        session.removeAttribute("cart");

    }


    @PostMapping(value = "/cart")
    public  void addCart(HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Product product = productRepository.getById(Integer.parseInt(request.getParameter("ItemID")));
        System.out.println(product);

        Item item = new Item();
        item.setQuantity(1);
        item.setProduct(product);


        Map<Integer, Item> itemCart = (Map<Integer, Item>) session.getAttribute("cart");
        if (itemCart == null) {
            itemCart = new HashMap<>();
        }
        Integer productId = item.getProduct().getId();
        if (itemCart.containsKey(productId)) {
            item = itemCart.get(productId);
            item.setQuantity(item.getQuantity() + 1);
            itemCart.put(productId, item);
        } else {
            itemCart.put(productId, item);
        }
        session.setAttribute("cart", itemCart);

    }

    @RequestMapping(value = "/show")
    public void show(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Map<Integer, Item> itemCart = (Map<Integer, Item>) session.getAttribute("cart");
        itemCart.forEach((key, value) -> {
            System.out.println(value.toString());
        });
    }

    @RequestMapping("/table")
    public ModelAndView showTable(){
        return new ModelAndView("checkout");
    }

    @RequestMapping("/detail/{id}")
    public ModelAndView showDetail(@PathVariable("id") Integer id  ){
        Product product = productRepository.getById(id);
        ModelAndView mav = new ModelAndView("productDetail");
        mav.addObject(product);
        return mav;
    }


}
