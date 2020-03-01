package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Review_size;
import net.lele.repository.Review_sizeRepository;

@Service
public class Review_sizeService {
	@Autowired
	Review_sizeRepository review_sizeRepository;
	
	public List<Review_size> findAll(){
		return review_sizeRepository.findAll();
	}
}
