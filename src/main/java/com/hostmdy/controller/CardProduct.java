package com.hostmdy.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.model.Cart;
import com.hostmdy.model.ProductDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class CardProduct
 */
public class CardProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;

	private ProductDAO productDAO;

	@Override
	public void init() throws ServletException {
		productDAO = new ProductDAO(dataSource);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CardProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DecimalFormat dcf = new DecimalFormat("#.##");
		HttpSession session = request.getSession(false);
		User user = (User) request.getSession().getAttribute("user");
        //User user = (User) session.getAttribute("user");
		// request.setAttribute("user", user);
		if (user != null) {
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cartList");
			List<Cart> cartProduct = null;
			if (cart_list != null) {
				cartProduct = productDAO.getCartProduct(cart_list);
				// if(cartProduct != null) {
				double total = productDAO.getTotalCartPrice(cart_list);
				request.setAttribute("dcf", dcf);
				request.setAttribute("total", total);
				request.setAttribute("cartProduct", cartProduct);
				RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				rd.forward(request, response);

			}
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
