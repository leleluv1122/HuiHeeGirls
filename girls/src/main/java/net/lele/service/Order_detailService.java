package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.Order_detail;
import net.lele.repository.Order_detailRepository;

@Service
public class Order_detailService {
	@Autowired
	Order_detailRepository order_detailRepository;

	public List<Order_detail> findAll(){
		return order_detailRepository.findAll();
	}
	
	public boolean hasErrors(Order_detail order_detail, BindingResult bindingResult) {
		if(bindingResult.hasErrors())
			return true;
		return false;
	}
	
	public void save(Order_detail od) {
		Order_detail oddd = new Order_detail();
		oddd.setOrders(od.getOrders());
		oddd.setProduct(od.getProduct());
		oddd.setCount(od.getCount());
		order_detailRepository.save(oddd);
	}
}