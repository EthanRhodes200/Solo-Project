package com.ethan.fellowtravelers.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ethan.fellowtravelers.models.Location;
import com.ethan.fellowtravelers.models.User;
import com.ethan.fellowtravelers.services.LocationService;
import com.ethan.fellowtravelers.services.UserServices;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
@Controller
public class LocationController {
	
	@Autowired LocationService locaServ;
	@Autowired UserServices userServ;
	
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/logout";
		}else {
			model.addAttribute("locations", locaServ.allLocations());
			model.addAttribute("user", userServ.findById((Long)session.getAttribute("userId")));
			return "dashboard.jsp";
		}
	}
	
	@GetMapping("/traveled/new")
	public String newTeam(@ModelAttribute("location") Location location, Model model, HttpSession session) {
		User loggedUser = userServ.findById((Long) session.getAttribute("userId"));
		model.addAttribute("user", loggedUser);
		return "addLocation.jsp";
	}
	
	@PostMapping("/traveled/create")
	public String createLocation(@Valid @ModelAttribute("location") Location location, BindingResult result, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			return "addLocation.jsp";
		}else {
			locaServ.createLocation(location);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/traveled/{id}")
	public String showLocation(@PathVariable("id") Long id, HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/logout";
		} else {
			User loggedUser = userServ.findById(userId);
			Location showLocation = locaServ.findLocationId(id);
			model.addAttribute("user", loggedUser);
			model.addAttribute("location", showLocation);
			return "showLocation.jsp";
		}
	}
	
	
	@GetMapping("/traveled/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId==null) {
			return "redirect:/logout";
		}else {
			Location showLocation = locaServ.findLocationId(id);
			model.addAttribute("location", showLocation);
			return "editLocation.jsp";
		}
	}
	
	
	@PutMapping("/traveled/{id}/update")
	public String updateLocation(@Valid @ModelAttribute("location") Location location, BindingResult result,
			HttpSession session,Model model ) {
		Long userId = (Long) session.getAttribute("userId");
		User loggedUser = userServ.findById(userId);
		if(userId == null) {
			return "redirect:/logout";
		}
		
		if (result.hasErrors()) {
    		return "editLocation.jsp";
    	}else {
    		location.setUser(loggedUser);
    		session.setAttribute("userId", loggedUser.getId());
    		locaServ.updateLocation(location);
    		return "redirect:/home";
	    }
    	
	}
	
	@RequestMapping("/traveled/{id}/delete")
	public String destroy(@PathVariable("id")Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/logout";
		}else {
			locaServ.deleteLocation(id);
			return "redirect:/home";
		}
	}
	
	

	}
	