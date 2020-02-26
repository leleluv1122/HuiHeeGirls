package net.lele.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String board(Model model, Board board) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("user", userService.findAll());
		return "user/board";
	}

	@RequestMapping(value = "user/board", method = RequestMethod.POST)
	public String board(Model model, Board board, BindingResult bindingResult) throws Exception {
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

	@RequestMapping(value = "user/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model, Basket basket) throws Exception {
		basketService.delete(id);
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("basket", basketService.findAll());
		return "redirect:/user/basket";
	}

	@RequestMapping(value = "/user/order/{id}")
	public String order(@PathVariable("id") int id, Model model, Basket basket) throws Exception {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("basket", basketService.findAll());
		model.addAttribute("idd", id);
		return "/user/order";
	}

	@RequestMapping(value = "user/basket")
	public String basket(Model model, Basket basket) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName(); // 이거도 jh_o214
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("basket", basketService.findByUserUserId(userId));

		/* model.addAttribute("basket", basketService.findAll()); */
		/*
		 * Object userId =
		 * SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 * //userid출력됨 (jh_o214)
		 */
		return "user/basket";
	}

	@ResponseBody
	@RequestMapping(value = "user/deleteA", method = RequestMethod.POST)
	public int deleteA(@RequestParam("chbox[]") List<String> Arr, Basket basket) throws Exception {
		int result = 0;
		for(String i : Arr) {
			/* basket.setId(cartNum); */
			basketService.delete(Integer.parseInt(i));
		}
		result = 1;
		return result;
	}

}
