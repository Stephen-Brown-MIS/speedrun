package com.stephenbrown.speedrun.repositories;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.stephenbrown.speedrun.models.Item;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long>{
	// this method retrieves all the Items from the database
	
	@Query("SELECT i from Item i WHERE i.description LIKE %?1%")
	public List<Item> findAll(String keyword);
	
}
