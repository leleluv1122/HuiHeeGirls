package net.lele.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.lele.domain.Orders;
import net.lele.domain.Product;
import net.lele.repository.OrdersRepository;
import net.lele.service.CategoryService;
import net.lele.service.OrderService;
import net.lele.service.Order_detailService;
import net.lele.service.Order_statusService;
import net.lele.service.ProductService;
import net.lele.service.Product_colorService;
import net.lele.service.Product_detailService;

@Controller
public class AdminController {
	@Value("${file.upload.directory}")
	String uploadFileDir;

	@Autowired
	ProductService productService;
	@Autowired
	Product_detailService product_detailService;
	@Autowired
	Product_colorService product_colorService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	OrderService orderService;
	@Autowired
	Order_detailService order_detailService;
	@Autowired
	Order_statusService order_statusService;
	@Autowired
	OrdersRepository ordersRepository;

	@Secured("ROLE_ADMIN")
	@RequestMapping("/admin/upload")
	public String upload(Model model, Product product) {
		model.addAttribute("category", categoryService.findAll());
		return "admin/upload";
	}

	@RequestMapping(value = "/admin/upload", method = RequestMethod.POST)
	public String upload(Model model, Product product, BindingResult bindingResult)
			throws Exception { /* @RequestPart MultipartFile image_url */
		if (productService.hasErrors(product, bindingResult)) {
			model.addAttribute("category", categoryService.findAll());
			return "redirect:/admin/upload";
		}
		/*
		 * File destinationFile = new File(uploadFileDir +
		 * image_url.getOriginalFilename()); destinationFile.getParentFile().mkdirs();
		 * image_url.transferTo(destinationFile);
		 */
		productService.save(product);
		return "redirect:/guest/index";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/admin/orderlist")
	public String orderlist(Model model, Orders orders) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("order", orderService.findAll());
		model.addAttribute("status", order_statusService.findAll());
		model.addAttribute("order_detail", order_detailService.findAll());
		return "/admin/orderlist";
	}
	
	@RequestMapping(value="/admin/orderlist", method = RequestMethod.POST)
	public String orderlist(Model model, Orders orders, BindingResult bindingResult) {
		Orders o = orderService.findByRid(orders.getRid());
		o.setStatus(orders.getStatus());
		ordersRepository.save(o);
		return "redirect:/admin/orderlist";
	}
	
	
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/admin/index")
	public String index(Model model) {
		model.addAttribute("category", categoryService.findAll());
		
		return "/admin/index";
	}
}
