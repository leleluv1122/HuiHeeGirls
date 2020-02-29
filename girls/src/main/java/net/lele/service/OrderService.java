package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.Orders;
import net.lele.repository.OrdersRepository;

@Service
public class OrderService {
	@Autowired
	OrdersRepository orderRepository;

	public List<Orders> findByUserUserId(String userId){
		return orderRepository.findByUserUserId(userId);
	}
	
	public List<Orders> findById(String id){
		return orderRepository.findById(id);
	}
	
	public int countByUserUserId(String userId) {
		return orderRepository.countByUserUserId(userId);
	}
	
	public List<Orders> findAllByOrderByRidDesc(){
		return orderRepository.findAllByOrderByRidDesc();
	}
	
	public List<Orders> findAll() {
		return orderRepository.findAll();
	}

	public boolean hasErrors(Orders order, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		return false;
	}

	public void save(Orders order) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		Orders o = new Orders();
		o.setId(order.getId());
		o.setUser(order.getUser());
		o.setOrderRec(order.getOrderRec());
		o.setUserAddr1(order.getUserAddr1());
		o.setUserAddr2(order.getUserAddr2());
		o.setUserAddr3(order.getUserAddr3());
		o.setOrderPhon(order.getOrderPhon());
		o.setOrderDate(timestamp);
		o.setAmount(order.getAmount());
		o.setStatus(order.getStatus());
		orderRepository.save(o);
	}
	
	public void delete(int id) {
		orderRepository.deleteById(id);
	}
}
