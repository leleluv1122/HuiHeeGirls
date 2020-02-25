package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Product_detail;

public interface Product_detailRepository extends JpaRepository<Product_detail, Integer> {
	public List<Product_detail> findByProductId(int id);

}
