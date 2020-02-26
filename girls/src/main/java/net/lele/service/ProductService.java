package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Product;
import net.lele.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	ProductRepository productRepository;

	public List<Product> findAll() {
		return productRepository.findAll();
	}
	
	public List<Product> findAllByOrderByIdDesc(){
		return productRepository.findAllByOrderByIdDesc();
	}
}
