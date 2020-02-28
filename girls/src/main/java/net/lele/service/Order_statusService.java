package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Order_status;
import net.lele.repository.Order_statusRepository;

@Service
public class Order_statusService {
	@Autowired
	Order_statusRepository os;
	
	List<Order_status> findAll(){
		return os.findAll();
	}
}
