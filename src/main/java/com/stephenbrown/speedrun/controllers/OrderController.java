package com.stephenbrown.speedrun.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.stephenbrown.speedrun.models.Order;
import com.stephenbrown.speedrun.models.OrderItem;
import com.stephenbrown.speedrun.models.User;
import com.stephenbrown.speedrun.services.ItemService;
import com.stephenbrown.speedrun.services.OrderItemService;
import com.stephenbrown.speedrun.services.OrderService;
import com.stephenbrown.speedrun.services.UserService;

@Controller

public class OrderController {
	@Autowired
	OrderService orderServ;

	@Autowired
	UserService userServ;
	
	@Autowired
	OrderItemService orderItemServ;

	@Autowired
	ItemService itemServ;
	
	@GetMapping("/orders")
	public String dashboard(Model model,@ModelAttribute("order") Order order,HttpSession session, RedirectAttributes redirect) {
		if (session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error","Please login");
			return "redirect:/";
		}
		Long id = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(id);
		model.addAttribute("loggedUser",loggedUser);
		List<Order> orders = orderServ.allOrders();
		model.addAttribute("orders",orders);
		return "dashboard.jsp";
	}

    @RequestMapping("/orders/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model,HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long uid = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(uid);
		model.addAttribute("loggedUser",loggedUser);
		
		Order order = orderServ.findOrder(id);
        model.addAttribute("order", order);
		OrderItem orderItem = orderItemServ.findOrderItem(id); 		
		model.addAttribute("orderItem",orderItem);


        return "edit.jsp";
    }
    
    @RequestMapping(value="/orders/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("order") Order order, BindingResult result,@PathVariable("id") Long id,HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}   	
    	
    	if(result.hasErrors()) {
    		return "edit.jsp";
    	}
		Long userId = (Long) session.getAttribute("userId");
		order.setPostedBy(userServ.findbyId(userId));
    	orderServ.updateOrder(order);
    	return "redirect:/orders";
    } 

    @RequestMapping("/orders/{id}")
	public String display(@PathVariable("id") Long id, Model model,HttpSession session ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Order order = orderServ.findOrder(id); 
		model.addAttribute("order",order);
//		for(OrderItem x:order.getOrder_items()) {
//			System.out.println(x.getQuantity());
//			
//		}

		OrderItem orderItem = orderItemServ.findOrderItem(id); 		
		model.addAttribute("orderItem",orderItem);
		Long idSess = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(idSess);
		model.addAttribute("loggedUser",loggedUser);

		return "display.jsp";
	}  
	
	@GetMapping("/orders/new")
	public String newOrder(@ModelAttribute("order") Order order, HttpSession session,Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Long uid = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(uid);
		model.addAttribute("loggedUser",loggedUser);
		
		return "add.jsp";
	}
	
	@GetMapping("/orderitem/add/{id}")
	public String newOrderItem(Model model, @PathVariable("id") Long Id, 
								@ModelAttribute("order") Order order, 
								@ModelAttribute("orderItem") OrderItem orderItem,
								@ModelAttribute("item") Item item,
								HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long uid = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findbyId(uid);
		model.addAttribute("loggedUser",loggedUser);
		
		String keyword ="turkey";
		List<Item> items = itemServ.allItems(keyword);
		model.addAttribute("items",items);
		model.addAttribute("keyword", keyword);
				
		return "addOrderItem.jsp";
	}
	
	 @RequestMapping("/order/{orderId}/addItem/{itemId}")
	    public String addQty(@PathVariable("orderId") Long orderId,
	    					@PathVariable("itemId") Long itemId,
	    					Model model,
	    					HttpSession session) {
			if (session.getAttribute("userId") == null) {
				return "redirect:/";
			}
			
			Long uid = (Long) session.getAttribute("userId");
			User loggedUser = userServ.findbyId(uid);
			model.addAttribute("loggedUser",loggedUser);
			
	    	Order order = orderServ.findOrder(orderId);
			Item item = itemServ.findItem(itemId);
	        model.addAttribute("item", item);
	        model.addAttribute("order", order);
	        model.addAttribute("orderItem", new OrderItem());
	        return "addOrderItemQty.jsp";
	    }
	 
	 @PostMapping("/createOrderItem/{orderId}")
		public String createQty(
				@PathVariable("orderId") Long orderId,
				@Valid @ModelAttribute("orderItem") OrderItem orderItem,
				BindingResult result,
				Model model,
				HttpSession session) {
			if (session.getAttribute("userId") == null) {
				return "redirect:/";
			}
		 	orderItemServ.createOrderItem(orderItem);
			return "redirect:/orderitem/add/{orderId}";
		}
	
	
	@PostMapping("/createOrder")
	public String create(
			@Valid @ModelAttribute("order") Order order,
			BindingResult result,
			Model model,
			HttpSession session) {
		if(result.hasErrors()) {
			List<Order> orders = orderServ.allOrders();
			model.addAttribute("orders",orders);
			return "add.jsp";
		}  		
		Long userId = (Long) session.getAttribute("userId");
		order.setPostedBy(userServ.findbyId(userId));
		orderServ.createOrder(order);
		return "redirect:/orders";
	}
	@DeleteMapping("/orders/{id}")
	public String deleteOrder(@PathVariable("id") Long id) {
		orderServ.deleteOrder(id);
		return "redirect:/orders";
	}
	
	@DeleteMapping("/orderItem/{orderItemId}")
	public String deleteOrderItem(@PathVariable("orderItemId") Long id){
		orderItemServ.deleteOrderItem(id);
		return "redirect:/orders";
	}

}


