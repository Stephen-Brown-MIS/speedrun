package com.stephenbrown.speedrun.services;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.stephenbrown.speedrun.models.Order;
import com.stephenbrown.speedrun.models.OrderItem;
import com.stephenbrown.speedrun.repositories.*;


@Service
public class OrderItemService {
    // adding the order item repository as a dependency
    private final OrderItemRespository orderItemRepo;
    
    public OrderItemService(OrderItemRespository orderItemRepository) {
        this.orderItemRepo = orderItemRepository;
    }
    // returns all the order items
    public List<OrderItem> allOrderItems() {
        return orderItemRepo.findAll();
    }
    // creates a order item
    public OrderItem createOrderItem(OrderItem b) {
        return orderItemRepo.save(b);
    }
    // retrieves an order item
    public OrderItem findOrderItem(Long id) {
        Optional<OrderItem> optionalOrderItem = orderItemRepo.findById(id);
        if(optionalOrderItem.isPresent()) {
            return optionalOrderItem.get();
        } else {
            return null;
        }
    }
    // updateOrderItem will take in a Order item object and save it to our database
    // our repository will automatically update an existing Order object if their IDs match
    public OrderItem updateOrderItem(OrderItem OrderItem) {
		return orderItemRepo.save(OrderItem);
	}
	
    // to delete a order item, we simply pass in the order ID and if our repository finds it, the order will be deleted
	public void deleteOrderItem(Long id) {
		Optional<OrderItem> optionalOrderItem = orderItemRepo.findById(id);
		if(optionalOrderItem.isPresent()) {
			orderItemRepo.deleteById(id);
		}
	}
}
