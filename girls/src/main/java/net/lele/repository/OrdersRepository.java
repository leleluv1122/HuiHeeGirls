package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {
	List<Orders> findByUserUserId(String userId);
	
	List<Orders> findAllByOrderByRidDesc();
	
	int countByUserUserId(String userId);
	
	Orders findByRid(int rid);
	
	List<Orders> findById(String id);
}
