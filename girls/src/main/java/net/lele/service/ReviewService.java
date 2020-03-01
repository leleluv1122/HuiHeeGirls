package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Review;
import net.lele.repository.ReviewRepository;

@Service
public class ReviewService {
	@Autowired
	ReviewRepository reviewRepository;

	public List<Review> findAll() {
		return reviewRepository.findAll();
	}
	
	public List<Review> findByProductId(int id){
		return reviewRepository.findByProductId(id);
	}

	public void save(Review review) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		Review r = new Review();
		r.setColor(review.getColor());
		r.setDetail(review.getDetail());
		r.setHeight(review.getHeight());
		r.setProduct(review.getProduct());
		r.setSize(review.getSize());
		r.setStar(review.getStar());
		r.setUser(review.getUser());
		r.setWeight(review.getWeight());
		r.setWrite_date(timestamp);
		reviewRepository.save(r);
	}
}
