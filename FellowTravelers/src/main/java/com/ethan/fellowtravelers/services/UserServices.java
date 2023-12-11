package com.ethan.fellowtravelers.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ethan.fellowtravelers.models.LoginUser;
import com.ethan.fellowtravelers.models.User;
import com.ethan.fellowtravelers.repositories.UserRepository;

	@Service
	public class UserServices {
		@Autowired
		private UserRepository userRepo;
		
		public User register(User newUser, BindingResult result) {
			Optional<User> user = userRepo.findByEmail(newUser.getEmail());
			
			if(user.isPresent()) {
				result.rejectValue("email", "Matches", "An account with that email already exists!");
			}
			
			if(!newUser.getPassword().equals(newUser.getConfirm())) {
				result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
			}
			
			if(result.hasErrors()) {
				return null;
			}
			
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return userRepo.save(newUser);
			
		}
		
		public User login(LoginUser newLogin, BindingResult result) {
			Optional<User> registeredUser = userRepo.findByEmail(newLogin.getEmail());
			
			if(!registeredUser.isPresent()) {
				result.rejectValue("email", "Matches", "User not found");
				return null;
			}
			
			User user = registeredUser.get();
			
			if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
				result.rejectValue("password", "Matches", "Invalid Password!");
			}
			
			if(result.hasErrors()) {
				return null;
			}
			return user;
		
		}
		
		
		public User findById(Long id) {
			Optional<User>optUser = userRepo.findById(id);
			if(optUser.isPresent()) {
				return optUser.get();
			}else {
				return null;
			}
		}
		
		
		public User findByEmail(String email) {
			Optional<User> userEmail = userRepo.findByEmail(email);
			if(userEmail.isPresent()) {
				return userEmail.get();
			}else {
				return null;
			}
		}
	}


