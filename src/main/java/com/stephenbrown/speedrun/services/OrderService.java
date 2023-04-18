package com.stephenbrown.speedrun.services;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.stephenbrown.speedrun.models.Order;
import com.stephenbrown.speedrun.repositories.OrderRepository;
@Service
public class OrderService {
    // adding the order repository as a dependency
    private final OrderRepository orderRepo;
    
    public OrderService(OrderRepository orderRepository) {
        this.orderRepo = orderRepository;
    }
    // returns all the orders
    public List<Order> allOrders() {
        return orderRepo.findAll();
    }
    // creates a order
    public Order createOrder(Order b) {
        return orderRepo.save(b);
    }
    // retrieves a order
    public Order findOrder(Long id) {
        Optional<Order> optionalOrder = orderRepo.findById(id);
        if(optionalOrder.isPresent()) {
            return optionalOrder.get();
        } else {
            return null;
        }
    }
    // updateOrder will take in a Order object and save it to our database
    // our repository will automatically update an existing Order object if their IDs match
    public Order updateOrder(Order Order) {
		return orderRepo.save(Order);
	}
	
    // to delete a order, we simply pass in the order ID and if our repository finds it, the order will be deleted
	public void deleteOrder(Long id) {
		Optional<Order> optionalOrder = orderRepo.findById(id);
		if(optionalOrder.isPresent()) {
			orderRepo.deleteById(id);
		}
	}
}

