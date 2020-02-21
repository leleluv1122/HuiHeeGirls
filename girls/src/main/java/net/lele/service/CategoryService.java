package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Category;
import net.lele.repository.CategoryRepository;


@Service
public class CategoryService {
	@Autowired
	CategoryRepository categoryRepository;
	
	public List<Category> findAll(){
		return categoryRepository.findAll();
	}
	
	public List<Category> findCategoryById(int id){
		return categoryRepository.findCategoryById(id);
	}
}
