package com.stephenbrown.speedrun.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stephenbrown.speedrun.models.OrderItem;

@Repository
public interface OrderItemRespository extends CrudRepository<OrderItem, Long>{
	// this method retrieves all the orders from the database
    List<OrderItem> findAll();
}
