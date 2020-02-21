package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.Board;
import net.lele.repository.BoardRepository;

@Service
public class BoardService {
	@Autowired
	BoardRepository br;
	
	/*
	 * private static final SimpleDateFormat sdf = new
	 * SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	 */
	public boolean hasErrors(Board board, BindingResult bindingResult) {
		if(bindingResult.hasErrors())
			return true;
		return false;
	}
	
	public void save(Board board) {
		Board bo = new Board();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        
		bo.setTitle(board.getTitle());
		bo.setUser(board.getUser());
		/* bo.setWriter(board.getWriter()); */
		bo.setDetail(board.getDetail());
		bo.setCreated_date(timestamp);
		br.save(bo);
	}
	
	public List<Board> findAll(){
		return br.findAll();
	}
	
	public List<Board> findAllByOrderByIdDesc() {
		return br.findAllByOrderByIdDesc();
	}
	
	public List<Board> findBoardById(int id) {
		return br.findBoardById(id);
	}
}
