package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
}
