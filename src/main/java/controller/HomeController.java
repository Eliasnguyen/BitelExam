package controller;

import model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/web")
public class HomeController {

    @GetMapping(value = "/hi")
    public String getAllCategories(ModelMap modelMap) {
        return "index";
    }
    @PostMapping("/login")
    public ModelAndView login(Model model, @ModelAttribute("user") User user){

        if(user != null && user.getUserName().equals("abc") && user.getPassWord().equals("123")){
            return new ModelAndView("product");
        }
        else return null;
    }
}
