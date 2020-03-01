package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Review_weight;
import net.lele.repository.Review_weightRepository;

@Service
public class Review_weightService {
	@Autowired
	Review_weightRepository review_weightRepository;
	
	public List<Review_weight> findAll(){
		return review_weightRepository.findAll();
	}
}
