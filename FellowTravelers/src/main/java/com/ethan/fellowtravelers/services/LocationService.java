package com.ethan.fellowtravelers.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ethan.fellowtravelers.models.Location;
import com.ethan.fellowtravelers.models.User;
import com.ethan.fellowtravelers.repositories.LocationRepository;

@Service
public class LocationService {
	
	@Autowired
	private LocationRepository locaRepo;
	
	// returns all locations
	public List<Location> allLocations(){
		return locaRepo.findAll();
	}
	
	// creates a location
	public Location createLocation(Location location) {
		return locaRepo.save(location);
	}
	
	// retrieves a location by Id
	public Location findLocationId(Long id) {
		Optional<Location> optLocation = locaRepo.findById(id);
		if(optLocation.isPresent()) {
			return optLocation.get();
		}else {
			return null;
		}
	}
	
	// update a location
	public Location updateLocation(Location location) {
		return locaRepo.save(location);
	}
	
	// delete a location
	public void deleteLocation(Long id) {
		locaRepo.deleteById(id);
	}
	
	public List<Location>myLocation(User user){
		return locaRepo.findByUserId(user.getId());
	}

	
	
}