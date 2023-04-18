package com.stephenbrown.speedrun.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.stephenbrown.speedrun.models.LoginUser;
import com.stephenbrown.speedrun.models.User;
import com.stephenbrown.speedrun.repositories.UserRepository;
@Service
public class UserService {
    // adding the user repository as a dependency	
    @Autowired	
	private UserRepository userRepo;

    public User register(User u, BindingResult result) {
    	//check to see email is already in table
       	Optional<User> potentialUser = userRepo.findByEmail(u.getEmail());
    	if(potentialUser.isPresent()) {
    		//System.out.println("Potential user is already in system");
    		result.rejectValue("email", null,"Email address already exisits");
    	}
    	
    	if(!u.getConfirm().equals(u.getPassword())) {
    		//System.out.println("pass and confirm don't match");
    		result.rejectValue("confirm", null,"Passwords don't match");
    	}
    	if(result.hasErrors()) {
    		return null;
    	}
    	// if no errors, hash the password and write to DB 
        String hashed = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt());
       	u.setPassword(hashed);
    	return userRepo.save(u); 
    }
    	
    	public User login(LoginUser l, BindingResult result) {
    		// call new repo feature findByEmail
    		Optional<User> optionalUser = userRepo.findByEmail(l.getEmail());
    		System.out.println("test point");
    		if(!optionalUser.isPresent()) {
    			result.rejectValue("email", null,"Please enter a valid email & password");
    			return null;
    		}
    		User user = optionalUser.get();
        	
    		if(!BCrypt.checkpw(l.getPassword(), user.getPassword())) {
        	    result.rejectValue("password", null, "Please enter a valid email & password");
    		
    		//if (!user.getPassword().equals(l.getPassword())) {
    		//	result.rejectValue("password", null,"Please enter a valid email & password");
    		}
    		if(result.hasErrors()) {
        		return null;
        	}
    		return user;
  	}
    	public User findbyId(Long id) {
    		Optional<User> optionalUser = userRepo.findById(id);
    		if (optionalUser.isEmpty()) {
    			return null;
    		}
    		return optionalUser.get();
    	}
}
