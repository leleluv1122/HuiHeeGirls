package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Product_color;
import net.lele.repository.Product_colorRepository;

@Service
public class Product_colorService {
	@Autowired
	Product_colorRepository product_colorRepository;
	
	public List<Product_color> findAll(){
		return product_colorRepository.findAll();
	}
	
	public List<Product_color> findByProductId(int id){
		return product_colorRepository.findByProductId(id);
	}
}
