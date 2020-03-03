package net.lele.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	int enable;
	String userId;

	String password;
	String userType;
	String name;
	String email;
	String phone;
	String address;
	String address_detail;
	int postcode;
	String addrplus;
}
