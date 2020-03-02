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
@org.hibernate.annotations.DynamicUpdate
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int rid;
	
	String id;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	User user;
	
	String orderRec;
	String userAddr1;
	String userAddr2;
	String userAddr3;
	String orderPhon;
	Double amount; //총가격
	Timestamp orderDate;
	
	@ManyToOne
	@JoinColumn(name = "status")
	Order_status status;
}
