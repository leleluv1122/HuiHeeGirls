package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}
