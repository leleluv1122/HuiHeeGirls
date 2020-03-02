package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Review_star;
import net.lele.repository.Review_starRepository;

@Service
public class Review_starService {
	@Autowired
	Review_starRepository review_starRepository;
	
	public List<Review_star> findAll(){
		return review_starRepository.findAll();
	}
}
