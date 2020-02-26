package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Product_qna;

public interface Product_qnaRepository extends JpaRepository<Product_qna, Integer> {
	public List<Product_qna> findByProductId(int id);

	public List<Product_qna> findAllByOrderByIdDesc();
	/* public List<Product_qna> findById(int id); */
	
	public Product_qna findById(int id);
}
