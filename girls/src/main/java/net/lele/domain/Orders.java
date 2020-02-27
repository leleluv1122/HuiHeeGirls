package net.lele.domain;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class Orders {
	@Id
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
}
