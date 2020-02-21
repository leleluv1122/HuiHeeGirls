package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	@Query("SELECT c FROM Category c WHERE c.id = ?1")
	List<Category> findCategoryById(int id);
}
