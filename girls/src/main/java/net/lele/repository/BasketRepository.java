package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import net.lele.domain.Basket;

public interface BasketRepository extends JpaRepository<Basket, Integer> {

	int countByUserUserId(String userId);
	
	List<Basket> findByUserUserId(String userId);

	/*
	 * @Modifying
	 * 
	 * @Transactional
	 * 
	 * @Query("delete from Basket b where b.user.userId=?1") void
	 * deleteByUserId(String userId);
	 */

	@Modifying
	@Transactional
	void deleteByUserUserId(String userId);
	
	/*
	 * @Query("SELECT b.product.id as product, b.count, b.color FROM Basket b WHERE b.user.userId = ?1"
	 * ) List<Object[]> findByorder(String userId);
	 */
	
	/*
	 * @Query("SELECT b.user as user, COUNT(b.count) as cnt, b.product as product, b.color as color "
	 * + "FROM Basket b " + "GROUP BY b.user, b.product, b.color") List<Object[]>
	 * findBasketCount();
	 */

	/*
	 * @Query(
	 * value="SELECT new net.lele.domain.Basket(b.user as user, b.product as product, "
	 * + "b.color as color, count(b.count)) as count " + "FROM Basket" +
	 * "GROUP BY b.product, b.color", nativeQuery = true) List<Basket>
	 * findBasketCount();
	 */

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
