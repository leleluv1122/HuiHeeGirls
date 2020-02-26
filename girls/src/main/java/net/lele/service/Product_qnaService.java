package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.Product_qna;
import net.lele.repository.Product_qnaRepository;
import net.lele.utils.EncryptionUtils;

@Service
public class Product_qnaService {
	@Autowired
	Product_qnaRepository product_qnaRepository;

	public List<Product_qna> findAll() {
		return product_qnaRepository.findAll();
	}

	public Product_qna findById(int id) {
		return product_qnaRepository.findById(id);
	}

	public List<Product_qna> findByProductId(int id) {
		return product_qnaRepository.findByProductId(id);
	}
	
	public List<Product_qna> findAllByOrderByIdDesc(){
		return product_qnaRepository.findAllByOrderByIdDesc();
	}
	
	public boolean Match(Product_qna pq) {
		/* if() */
		return false;
	}

	public void save(Product_qna p) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Product_qna pq = new Product_qna();
		pq.setProduct(p.getProduct());
		pq.setTitle(p.getTitle());
		pq.setDate(timestamp);
		pq.setDetail(p.getDetail());
		pq.setWriter(p.getWriter());
		pq.setPassword(EncryptionUtils.encryptMD5(p.getPassword()));
		product_qnaRepository.save(pq);
	}

	public boolean hasErrors(Product_qna pq, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		return false;
	}
}
