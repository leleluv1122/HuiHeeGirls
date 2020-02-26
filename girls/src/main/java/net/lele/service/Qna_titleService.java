package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Qna_title;
import net.lele.repository.Qna_titleRepository;

@Service
public class Qna_titleService {
	@Autowired
	Qna_titleRepository qr;
	
	public List<Qna_title> findAll(){
		return qr.findAll();
	}
}
