package com.stephenbrown.speedrun.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stephenbrown.speedrun.models.Item;
import com.stephenbrown.speedrun.models.User;
import com.stephenbrown.speedrun.services.ItemService;
import com.stephenbrown.speedrun.services.UserService;

@Controller

public class ItemController {
	@Autowired
	ItemService itemServ;

	@Autowired
	UserService userServ;
	
	@GetMapping("/items")
	public String dashboard(Model model,@ModelAttribute("item") Item item,HttpSession session, 
			RedirectAttributes redirect,@Param("keyword") String keyword) {
		if (session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error","Please login");
			return "redirect:/";
		}
		Long id = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(id);
		model.addAttribute("loggedUser",loggedUser);
		List<Item> items = itemServ.allItems(keyword);
		model.addAttribute("items",items);
		model.addAttribute("keyword", keyword);
		return "itemDashboard.jsp";
	}

    @RequestMapping("/items/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model,HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Long uid = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(uid);
		model.addAttribute("loggedUser",loggedUser);
		
    	Item item = itemServ.findItem(id);
        model.addAttribute("item", item);
        return "itemEdit.jsp";
    }
    
    @RequestMapping(value="/items/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("item") Item item, BindingResult result,@PathVariable("id") Long id,HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}   	
    	
    	if(result.hasErrors()) {
    		return "itemEdit.jsp";
    	}
		Long userId = (Long) session.getAttribute("userId");
		itemServ.updateItem(item);
    	return "redirect:/items";
    } 

    @RequestMapping("/items/{id}")
	public String show(@PathVariable("id") Long id, Model model,HttpSession session ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Item item = itemServ.findItem(id); 
		model.addAttribute("item",item); 
		Long idSess = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(idSess);
		model.addAttribute("loggedUser",loggedUser);

		return "itemShow.jsp";
	}  
	
	@GetMapping("/items/new")
	public String newItem(@ModelAttribute("item") Item item, HttpSession session,Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Long uid = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(uid);
		model.addAttribute("loggedUser",loggedUser);
		
		return "itemAdd.jsp";
	}
	
	@PostMapping("/createitem")
	public String create(
			@Valid @ModelAttribute("item") Item item,
			BindingResult result,
			Model model,
			HttpSession session) {
		if(result.hasErrors()) {
//			List<Item> items = itemServ.allItems();
//			model.addAttribute("items",items);
			return "itemAdd.jsp";
		}  		
		Long userId = (Long) session.getAttribute("userId");
		itemServ.createItem(item);
		return "redirect:/items";
	}
	@DeleteMapping("/items/{id}")
	public String deleteItem(@PathVariable("id") Long id) {
		itemServ.deleteItem(id);
		return "redirect:/items";
	}
}


