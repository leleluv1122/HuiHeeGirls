package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Order_details;

public interface Order_detailRepository extends JpaRepository<Order_details, Integer> {
	@Query("SELECT o FROM Order_details o WHERE o.orderid = ?1")
	List<Order_details> findOdById(String id);
}
