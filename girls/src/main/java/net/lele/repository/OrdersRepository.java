package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {

}
