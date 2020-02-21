package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Basket;

public interface BasketRepository extends JpaRepository<Basket, Integer> {

}
