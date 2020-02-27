package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Basket;

public interface BasketRepository extends JpaRepository<Basket, Integer> {

	List<Basket> findByUserUserId(String userId);
	
	/*
	 * @Modifying
	 * 
	 * @Query("delete from Basket b where b.userId=:userId") void
	 * deleteByUserId(@Param("userId") String userId);
	 */
	
	/* void deleteByUserUserId(String userId); */
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
