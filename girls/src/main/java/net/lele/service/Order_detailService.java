package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.Order_details;
import net.lele.repository.Order_detailRepository;

@Service
public class Order_detailService {
	@Autowired
	Order_detailRepository order_detailRepository;

	public List<Order_details> findAll() {
		return order_detailRepository.findAll();
	}
	
	public List<Order_details> findOdById(String id){
		return order_detailRepository.findOdById(id);
	}

	public boolean hasErrors(Order_details order_detail, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		return false;
	}

	public void save(Order_details od) {
		Order_details oddd = new Order_details();
		/* oddd.setOrders(od.getOrders()); */
		oddd.setOrderid(od.getOrderid());
		oddd.setProduct(od.getProduct());
		oddd.setCount(od.getCount());
		oddd.setColor(od.getColor());
		order_detailRepository.save(oddd);
	}

}