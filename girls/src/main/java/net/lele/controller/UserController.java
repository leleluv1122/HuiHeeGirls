package net.lele.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.lele.domain.Basket;
import net.lele.domain.Board;
import net.lele.service.BasketService;
import net.lele.service.BoardService;
import net.lele.service.CategoryService;
import net.lele.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	BoardService boardService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	BasketService basketService;
	
	@RequestMapping("user/index")
	public String index(Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		return "user/index"; // 로그인한 사용자를 위한 첫 페이지 URL
	}
	
	@RequestMapping(value = "user/board")
	public String board(Model model, Board board) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("user", userService.findAll());
		return "user/board";
	}

	@RequestMapping(value = "user/board", method = RequestMethod.POST)
	public String board(Model model, Board board, BindingResult bindingResult) {
		model.addAttribute("category", categoryService.findAll());
		if (boardService.hasErrors(board, bindingResult)) {
			model.addAttribute("category", categoryService.findAll());
			model.addAttribute("user", userService.findAll());
			return "user/board";
		}
		boardService.save(board);
		return "redirect:/guest/boardlist";
	}


	@RequestMapping(value = "user/boarddetail/{id}")
	public String boarddetail(@PathVariable("id") int id, Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		List<Board> board = boardService.findBoardById(id);
		model.addAttribute("board", board);
		return "user/boarddetail";
	}

	
	@RequestMapping(value = "user/info", method = RequestMethod.GET)
	public String info(Model model) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("user", userService.findAll());
		return "user/info";
	}
	
	@RequestMapping(value = "user/basket")
	public String basket(Model model, Basket basket) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("basket", basketService.findAll());
		/* model.addAttribute("bd", basketService.delete(id)); */
		return "user/basket";
	}
}
