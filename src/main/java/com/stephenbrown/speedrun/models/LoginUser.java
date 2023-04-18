package com.stephenbrown.speedrun.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


public class LoginUser {

	 @NotEmpty(message="Email is required")
	 @Email (message="Please enter a valid email")
	 @Size (min=5)
	 private String email;
	 
	 @NotEmpty(message="Password is required")
	 @Size(min=8, message="Password must be at least 8 characters")
	 private String password;
	
	 public LoginUser() {
	     
	 }
	
	 public String getEmail() {
		 return email;
	 }
	 
	 public void setEmail(String email) {
		 this.email = email;
	 }
	 
	 public String getPassword() {
		 return password;
	 }
	 
	 public void setPassword(String password) {
		 this.password = password;
	 }
 
 
}