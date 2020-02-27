package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Order_details;

public interface Order_detailRepository extends JpaRepository<Order_details, Integer> {

}
