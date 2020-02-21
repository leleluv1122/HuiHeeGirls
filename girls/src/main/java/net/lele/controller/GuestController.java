package net.lele.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.lele.domain.Board;
import net.lele.model.Pagination;
import net.lele.model.UserRegistrationModel;
import net.lele.repository.BoardRepository;
import net.lele.service.BoardService;
import net.lele.service.CategoryService;
import net.lele.service.ProductService;
import net.lele.service.UserService;

@Controller
public class GuestController { // 로그인 하지 않은 사용자를 위한 페이지

	@Autowired
	UserService userService;
	@Autowired
	BoardService boardService;
	@Autowired
	BoardRepository boardRepository;
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;

	@RequestMapping({ "/", "guest/index" })
	public String index(Model model) {
		model.addAttribute("category", categoryService.findAll());
		return "guest/index"; // 로그인 하지 않은 사용자를 위한 첫 페이지
	}

	@RequestMapping("guest/productlist/{id}")
	public String productlist(@PathVariable("id") int id, Model model) {
		model.addAttribute("category", categoryService.findAll());
		/*
		 * List<Category> c = categoryService.findCategoryById(id);
		 * model.addAttribute("ca", c);
		 */
		model.addAttribute("idd", id);
		model.addAttribute("product", productService.findAll());
		return "guest/productlist";
	}

	@RequestMapping("guest/productdetail/{id}")
	public String productdetail(@PathVariable("id") int id, Model model) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("product", productService.findAll());
		model.addAttribute("idd", id);
		return "guest/productdetail";
	}

	@RequestMapping("guest/login")
	public String login(Model model) {
		model.addAttribute("category", categoryService.findAll());

		return "guest/login"; // 로그인 페이지 URL
	}

	@RequestMapping(value = "guest/register", method = RequestMethod.GET)
	public String register(UserRegistrationModel userModel, Model model) {
		model.addAttribute("category", categoryService.findAll());

		return "guest/register";
	}

	@RequestMapping(value = "guest/register", method = RequestMethod.POST)
	public String register(@Valid UserRegistrationModel userModel, BindingResult bindingResult, Model model) {
		model.addAttribute("category", categoryService.findAll());

		if (userService.hasErrors(userModel, bindingResult)) {
			return "guest/register";
		}
		userService.save(userModel);
		return "redirect:index";
	}

	/*
	 * @RequestMapping(value="guest/boardlist") public String boardlist(Model model)
	 * { model.addAttribute("list", boardService.findAllByOrderByIdDesc()); return
	 * "guest/boardlist"; }
	 */

	@RequestMapping(value = "guest/boardlist")
	public String boardlist(Model model, Pagination pagination) {
		model.addAttribute("category", categoryService.findAll());

		List<Board> list = boardRepository.findAll(pagination);
		model.addAttribute("list", list);
		model.addAttribute("orderBy", BoardRepository.orderBy); // 안댐ㅅㅣㅏㅂㄹ..
		model.addAttribute("searchBy", BoardRepository.searchBy);
		return "guest/boardlist";
	}
}