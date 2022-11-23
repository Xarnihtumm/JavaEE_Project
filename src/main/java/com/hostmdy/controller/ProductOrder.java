package com.hostmdy.controller;

import jakarta.annotation.Resource;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.sql.DataSource;

import com.hostmdy.model.Cart;
import com.hostmdy.model.Order;
import com.hostmdy.model.OrderDAO;
import com.hostmdy.model.ProductDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class ProductOrder
 */
public class ProductOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;

	private OrderDAO orderDAO;
	 private ProductDAO productDAO;

	@Override
	public void init() throws ServletException {
		orderDAO = new OrderDAO(dataSource);
		 productDAO = new ProductDAO(dataSource);

	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		if (user != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String productId = request.getParameter("id");
			int productQuantity = Integer.parseInt(request.getParameter("q"));
			
			if (productQuantity <= 0) {
				productQuantity = 1;
			}
			Order orderModel = new Order();
			orderModel.setId(Integer.parseInt(productId));
			orderModel.setUid(user.getId());
			orderModel.setQunatity(productQuantity);
			orderModel.setDate(formatter.format(date));

			boolean result = orderDAO.insertOrder(orderModel);
			if (result) {
				ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cartList");
				if (cart_list != null) {
					for (Cart c : cart_list) {
						if (c.getId() == Integer.parseInt(productId)) {
							cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
				}
				response.sendRedirect("userproduct");
			}

		} else {
			response.sendRedirect("login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
