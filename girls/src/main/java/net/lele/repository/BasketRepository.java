package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Basket;

public interface BasketRepository extends JpaRepository<Basket, Integer> {
	/*
	 * @Query("SELECT userid, productid, count(count) as count, p.* FROM basket b" +
	 * "JOIN product p ON b.productid = p.id" + "GROUP BY productid") List<Object>
	 * findBasketCount();
	 */
	/*
	 * @Query("SELECT user, product, count(count) as cnt FROM basket" +
	 * "GROUP BY b.product") List<Object[]> findBasketCount();
	 */
	/*
	 * @Query(
	 * value="SELECT user, product, COUNT(Basket) as count FROM Basket GROUP BY product"
	 * , nativeQuery = true) List<Object[]> findBasketOfCount();
	 * 
	 * List<Basket> findByUserId(int id);
	 */
}
