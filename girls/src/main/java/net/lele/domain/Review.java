package net.lele.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class Review {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@ManyToOne
	@JoinColumn(name = "productid")
	Product product;
	
	@ManyToOne
	@JoinColumn(name = "color")
	Product_color color;
	
	@ManyToOne
	@JoinColumn(name = "height")
	Review_height height;
	
	@ManyToOne
	@JoinColumn(name = "weight")
	Review_weight weight;
	
	String detail;
	
	@ManyToOne
	@JoinColumn(name = "star")
	Review_star star;
	
	@ManyToOne
	@JoinColumn(name = "size")
	Review_size size;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	User user;
	
	Timestamp write_date;
}
