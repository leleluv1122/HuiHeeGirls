package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Product_color;

public interface Product_colorRepository extends JpaRepository<Product_color, Integer> {
	public List<Product_color> findByProductId(int id);
	
	public Product_color findById(int id);
}
