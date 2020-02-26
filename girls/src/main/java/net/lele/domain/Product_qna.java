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
public class Product_qna {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;

	@ManyToOne
	@JoinColumn(name = "productid")
	Product product;

	@ManyToOne
	@JoinColumn(name="title")
	Qna_title title;
	
	/* @NotEmpty(message="내용을 입력해주세요") */
	String detail;
	
	/* @NotEmpty(message="작성자를 입력해주세요") */
	String writer;
	
	/*
	 * @NotEmpty(message="비밀번호를 입력해주세요")
	 * 
	 * @Size(min=4, max=20, message="4자리 이상 20자리 이하이어야 합니다.")
	 */
	String password;
	
	Timestamp date;
}
