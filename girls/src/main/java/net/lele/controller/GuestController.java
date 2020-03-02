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
import org.springframework.web.bind.annotation.RequestParam;

import net.lele.domain.Basket;
import net.lele.domain.Board;
import net.lele.domain.Product_qna;
import net.lele.model.Pagination;
import net.lele.model.UserRegistrationModel;
import net.lele.repository.BoardRepository;
import net.lele.service.BasketService;
import net.lele.service.BoardService;
import net.lele.service.CategoryService;
import net.lele.service.ProductService;
import net.lele.service.Product_colorService;
import net.lele.service.Product_detailService;
import net.lele.service.Product_qnaService;
import net.lele.service.Qna_titleService;
import net.lele.service.ReviewService;
import net.lele.service.Review_starService;
import net.lele.service.UserService;
import net.lele.utils.EncryptionUtils;

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
	@Autowired
	BasketService basketService;
	@Autowired
	Product_colorService ps;
	@Autowired
	Product_detailService pd;
	@Autowired
	Product_qnaService pq;
	@Autowired
	Qna_titleService qs;
	@Autowired
	ReviewService rs;
	@Autowired
	Review_starService review_starService;

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
		model.addAttribute("product", productService.findAllByOrderByIdDesc());
		return "guest/productlist";
	}

	@RequestMapping(value = "guest/productdetail/{id}")
	public String productdetail(@PathVariable("id") int id, Model model, Basket basket) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("product", productService.findAll());
		model.addAttribute("colors", ps.findByProductId(id));
		model.addAttribute("detail", pd.findByProductId(id));
		model.addAttribute("qna", pq.findAllByOrderByIdDesc());
		model.addAttribute("idd", id);
		model.addAttribute("review", rs.findByProductId(id));
		model.addAttribute("star", review_starService.findAll());

		return "guest/productdetail";
	}

	@RequestMapping(value = "guest/productdetail/{id}", method = RequestMethod.POST)
	public String productdetail(@PathVariable("id") int id, Model model, Basket basket, BindingResult bindingResult) {
		if (basketService.hasErrors(basket, bindingResult)) {
			model.addAttribute("category", categoryService.findAll());
			model.addAttribute("product", productService.findAll());
			model.addAttribute("colors", ps.findByProductId(id));
			model.addAttribute("detail", pd.findByProductId(id));
			model.addAttribute("qna", pq.findByProductId(id));
			model.addAttribute("idd", id);
			return "redirect:/guest/login";
		}

		basketService.save(basket);
		return "redirect:/user/basket";
	}

	@RequestMapping(value = "guest/qna/{id}")
	public String qna(@PathVariable("id") int id, Model model, Product_qna product_qna) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("idd", id);
		model.addAttribute("qna_title", qs.findAll());
		return "guest/qna";
	}

	@RequestMapping(value = "guest/qna/{id}", method = RequestMethod.POST)
	public String qna(@PathVariable("id") int id, @Valid Product_qna product_qna, BindingResult bindingResult,
			Model model) {
		if (pq.hasErrors(product_qna, bindingResult)) {
			model.addAttribute("category", categoryService.findAll());
			model.addAttribute("idd", id);
			model.addAttribute("qna_title", qs.findAll());
			return "guest/qna";
		}
		pq.save(product_qna);
		return "redirect:/guest/productdetail/{id}";
	}

	@RequestMapping(value = "guest/qna_password/{id}", method = RequestMethod.GET)
	public String qna_password(@PathVariable("id") int id, Model model) {
		model.addAttribute("category", categoryService.findAll());
		return "guest/qna_password";
	}

	@RequestMapping(value = "guest/qna_password/{id}", method = RequestMethod.POST)
	public String qna_password(@PathVariable("id") int id, Model model, @RequestParam String password) {
		model.addAttribute("idd", id);
		Product_qna aa = pq.findById(id);
		if (aa.getPassword().equals(EncryptionUtils.encryptMD5(password)) == false) {
			model.addAttribute("category", categoryService.findAll());
			return "guest/qna_password"; // 다시입력해주세요 만들어야된다..
		}
		return "redirect:/guest/qna_answer/{id}";
	}

	@RequestMapping(value = "guest/qna_answer/{id}")
	public String qna_answer(@PathVariable("id") int id, Model model) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("idd", id);
		model.addAttribute("qna", pq.findAll());
		return "guest/qna_answer";
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

	@RequestMapping(value = "guest/qnalist")
	public String qnalist(Model model) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("qnalist", pq.findAllByOrderByIdDesc());
		return "guest/qnalist";
	}
}
