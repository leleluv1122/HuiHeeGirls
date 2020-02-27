package net.lele.service;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.Orders;
import net.lele.repository.OrdersRepository;

@Service
public class OrderService {
	@Autowired
	OrdersRepository orderRepository;

	public List<Orders> findAll() {
		return orderRepository.findAll();
	}

	public boolean hasErrors(Orders order, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		return false;
	}

	public void save(Orders order) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}
		String orderId = ymd + "/" + subNum; // 주문번호 만들기

		Orders o = new Orders();
		o.setId(orderId);
		o.setUser(order.getUser());
		o.setOrderRec(order.getOrderRec());
		o.setUserAddr1(order.getUserAddr1());
		o.setUserAddr2(order.getUserAddr2());
		o.setUserAddr3(order.getUserAddr3());
		o.setOrderPhon(order.getOrderPhon());
		o.setAmount(order.getAmount());
		orderRepository.save(o);
	}
}
