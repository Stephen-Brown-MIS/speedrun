package com.stephenbrown.speedrun.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stephenbrown.speedrun.models.LoginUser;
import com.stephenbrown.speedrun.models.User;
import com.stephenbrown.speedrun.services.UserService;
import com.stephenbrown.speedrun.controllers.OrderController;

@Controller

public class MainController {
	@Autowired
	private UserService userServ;

	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "index.jsp";
	}

	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("user") User user, 
            BindingResult result, Model model, HttpSession session) {
        
        // call the register method in the service to check for errors 
		User newUser = userServ.register(user, result);
		// if newUser register has errors, then a null will be returned from the service 
        if(newUser == null) {
            // Adding an empty LoginUser before re-rendering the page. 
        	//Needed due to data binding of index.jsp, needs both user and login user to render
            model.addAttribute("loginUser", new LoginUser());
            return "index.jsp";
        }
         // If no errors, store their ID from the DB in session, in other words, log them in.
    	session.setAttribute("userId", newUser.getId());
        return "redirect:/orders";
    }
		    
	@GetMapping ("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("userId", null);
		return "redirect:/";
	}
			
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("loginUser") LoginUser loginUser, 
            BindingResult result, Model model, HttpSession session) {
        

        User user = userServ.login(loginUser, result);
    	
        if(user==null) {
            model.addAttribute("user", new User());
            return "index.jsp";
        }    
    	session.setAttribute("userId", user.getId());
        return "redirect:/orders";

    }
	
}
