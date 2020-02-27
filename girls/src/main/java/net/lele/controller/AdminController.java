package net.lele.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import net.lele.domain.Product;
import net.lele.service.CategoryService;
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
}
