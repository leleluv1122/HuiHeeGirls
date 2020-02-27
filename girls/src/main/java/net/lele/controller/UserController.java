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
import net.lele.domain.Orders;
import net.lele.service.BasketService;
import net.lele.service.BoardService;
import net.lele.service.CategoryService;
import net.lele.service.OrderService;
import net.lele.service.Order_detailService;
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
	@Autowired
	OrderService orderService;
	@Autowired
	Order_detailService order_detailService;

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

	/*
	 * @RequestMapping(value = "/user/order/{id}") public String
	 * order(@PathVariable("id") int id, Model model, Basket basket) throws
	 * Exception { model.addAttribute("category", categoryService.findAll());
	 * model.addAttribute("basket", basketService.findAll());
	 * model.addAttribute("idd", id); return "/user/order"; } //1개만 주문할경우
	 */

	@RequestMapping(value = "user/basket")
	public String basket(Model model, Basket basket, Orders orders) throws Exception {
		String userId = SecurityContextHolder.getContext().getAuthentication().getName(); // 이거도 jh_o214
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("basket", basketService.findByUserUserId(userId));
		return "user/basket";
	}

	@ResponseBody
	@RequestMapping(value = "user/deleteA", method = RequestMethod.POST)
	public int deleteA(@RequestParam("chbox[]") List<String> Arr, Basket basket) throws Exception {
		int result = 0;
		for (String i : Arr) {
			/* basket.setId(cartNum); */
			basketService.delete(Integer.parseInt(i));
		}
		result = 1;
		return result;
	}

}


/*
 * @RequestMapping(value = "user/basket", method = RequestMethod.POST) public
 * String basket(Model model, Basket basket, Orders orders, Order_detail
 * order_detail, BindingResult bindingResult) throws Exception { String userId =
 * SecurityContextHolder.getContext().getAuthentication().getName(); // 이거도
 * jh_o214 if (orderService.hasErrors(orders, bindingResult)) {
 * model.addAttribute("category", categoryService.findAll());
 * model.addAttribute("basket", basketService.findByUserUserId(userId)); }
 * orderService.save(orders); basketService.deleteByUserUserId(userId); return
 * "user/basket"; }
 */

/* model.addAttribute("basket", basketService.findAll()); */
/*
 * Object userId =
 * SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 * //userid출력됨 (jh_o214)
 */
