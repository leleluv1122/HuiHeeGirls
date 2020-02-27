package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Product_detail;
import net.lele.repository.Product_detailRepository;

@Service
public class Product_detailService {
	@Autowired
	Product_detailRepository product_detailRepository;
	
	public List<Product_detail> findAll(){
		return product_detailRepository.findAll();
	}
	
	public List<Product_detail> findByProductId(int id){
		return product_detailRepository.findByProductId(id);
	}
	
	public void save(Product_detail product_detail) {
		Product_detail pd = new Product_detail();
		pd.setProduct(product_detail.getProduct());
		pd.setDetail(product_detail.getDetail());
		product_detailRepository.save(pd);
	}
}
