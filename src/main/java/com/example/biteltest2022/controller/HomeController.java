package com.example.biteltest2022.controller;

import com.example.biteltest2022.model.Cart;
import com.example.biteltest2022.model.Item;
import com.example.biteltest2022.model.Product;
import com.example.biteltest2022.model.User;
import com.example.biteltest2022.repository.CartRepository;
import com.example.biteltest2022.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.example.biteltest2022.repository.ProductRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
    public String getAllCategories(ModelMap modelMap) {
        return "index";
    }


    @PostMapping("/login")
    public ModelAndView login(Model model, @ModelAttribute("user") User user){

        if(user != null && user.getUserName().equals("abc") && user.getPassWord().equals("123")){
            List<Product> inst = productRepository.findAll();
            ModelAndView mav = new ModelAndView("product2");
            mav.addObject("list",inst);
            return mav;
        }
        else return null;
    }

    @GetMapping(value = "/hi3")
    public void init(HttpServletRequest request) {
        HttpSession session =  request.getSession();
        String s  = new String("abc");
        session.setAttribute("us",s);
    }

    @GetMapping(value = "/hh")
    public void get(HttpServletRequest request){
        HttpSession session = request.getSession();
        String as = session.getAttribute("us").toString();
        System.out.println(as);
    }

    @RequestMapping(value = "/insert")
    public void insset(){
        User user = userRepository.getById(1);
        Product product = productRepository.getById(1);
        Cart cart = new Cart(user);

        List<Item> items = new ArrayList<>();
        Item item = new Item(product,3);
        item.setCart(cart);
        items.add(item);
        cart.setItems(items);
        cartRepository.save(cart);

    }
//    @RequestMapping(value = "/create")
//    public void createAndItem(HttpServletRequest re, HttpSession session){
//        Product product = productRepository.getById(1);
//        Item item= new Item(product,1);
//        if (!session.isNew()) {
//            session.invalidate();
//        }
//
//        addCart(item,session);
//
//
//    }

    @RequestMapping(value = "/cart")
    public void addCart( HttpSession session){
        Product product = productRepository.getById(1);
        Item item= new Item(product,1);

        Map<Integer, Item> itemCart = (Map<Integer, Item>) session.getAttribute("cart");
        if(itemCart == null){
            itemCart = new HashMap<>();
        }
        Integer productId = item.getProduct().getId();
        if(itemCart.containsKey(productId)){
            item = itemCart.get(productId);
            item.setQuantity(item.getQuantity() +1);
            itemCart.put(productId, item);
        }
        else {
            itemCart.put(productId, item);
        }
        session.setAttribute("cart",itemCart);
    }

    @RequestMapping(value = "/show")
    public void show(HttpServletRequest request){
        HttpSession session = request.getSession();
        Map<Integer, Item> itemCart = (Map<Integer, Item>) session.getAttribute("cart");
        System.out.println(itemCart.get(1).getQuantity());
    }

}
