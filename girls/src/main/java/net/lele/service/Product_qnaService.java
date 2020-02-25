package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Product_qna;
import net.lele.repository.Product_qnaRepository;
import net.lele.utils.EncryptionUtils;

@Service
public class Product_qnaService {
	@Autowired
	Product_qnaRepository product_qnaRepository;
	
	public List<Product_qna> findAll(){
		return product_qnaRepository.findAll();
	}
	
	public List<Product_qna> findByProductId(int id){
		return product_qnaRepository.findByProductId(id);
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
	}
}
