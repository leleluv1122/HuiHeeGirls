package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

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
	
	public boolean hasErrors(Product product, BindingResult bindingResult) {
		if(bindingResult.hasErrors())
			return true;
		if(product.getName() == null)
			return true;
		if(product.getPrice() == '0')
			return true;
		if(product.getDescription() == null)
			return true;
		return false;
	}
	
	public void save(Product product) {
		Product p = new Product();
		p.setCategory(product.getCategory());
		p.setDescription(product.getDescription());
		p.setDiscount(product.getDiscount());
		p.setImage_url(product.getImage_url());
		p.setName(product.getName());
		p.setPrice(product.getPrice());
		productRepository.save(p);
	}
}
