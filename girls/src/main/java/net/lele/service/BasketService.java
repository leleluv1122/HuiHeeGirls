package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Basket;
import net.lele.repository.BasketRepository;


@Service
public class BasketService {
	@Autowired
	BasketRepository basketRepository;
	
	public List<Basket> findAll(){
		return basketRepository.findAll();
	}
}
