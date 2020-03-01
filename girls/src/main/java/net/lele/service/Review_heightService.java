package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Review_height;
import net.lele.repository.Review_heightRepository;

@Service
public class Review_heightService {
	@Autowired
	Review_heightRepository review_heightRepository;
	
	public List<Review_height> findAll(){
		return review_heightRepository.findAll();
	}
}
