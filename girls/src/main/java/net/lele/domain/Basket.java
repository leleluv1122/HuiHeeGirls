package net.lele.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class Basket {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	User user;

	@ManyToOne
	@JoinColumn(name = "productid")
	Product product;

	int count;
	
	@ManyToOne
	@JoinColumn(name="color")
	Product_color color;
	/* String option; */
}
