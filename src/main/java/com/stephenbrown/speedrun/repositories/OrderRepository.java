package com.stephenbrown.speedrun.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stephenbrown.speedrun.models.Order;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long>{
	// this method retrieves all the orders from the database
    List<Order> findAll();
}
