package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	/*
	 * @Query("SELECT p FROM Product p WHERE p.id=?1") List<Product>
	 * findProductById(int id);
	 */
	
}
