package com.stephenbrown.speedrun.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.stephenbrown.speedrun.models.Item;
import com.stephenbrown.speedrun.repositories.ItemRepository;
@Service
public class ItemService {
    // adding the Item repository as a dependency
    private final ItemRepository ItemRepo;
    
    public ItemService(ItemRepository ItemRepository) {
        this.ItemRepo = ItemRepository;
    }
    // returns all the Items
    public List<Item> allItems(String keyword) {
    	if (keyword !=  null){
//    		return ItemRepo.findAll(keyword);
    	}
        return ItemRepo.findAll();
    } 
    // creates a Item
    public Item createItem(Item b) {
        return ItemRepo.save(b);
    }
    // retrieves a Item
    public Item findItem(Long id) {
        Optional<Item> optionalItem = ItemRepo.findById(id);
        if(optionalItem.isPresent()) {
            return optionalItem.get();
        } else {
            return null;
        }
    }
    // updateItem will take in a Item object and save it to our database
    // our repository will automatically update an existing Item object if their IDs match
    public Item updateItem(Item Item) {
		return ItemRepo.save(Item);
	}
	
    // to delete a Item, we simply pass in the Item ID and if our repository finds it, the Item will be deleted
	public void deleteItem(Long id) {
		Optional<Item> optionalItem = ItemRepo.findById(id);
		if(optionalItem.isPresent()) {
			ItemRepo.deleteById(id);
		}
	}
}

