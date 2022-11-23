package com.hostmdy.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.model.Product;
import com.hostmdy.model.ProductDAO;
import com.hostmdy.model.User;
import com.hostmdy.model.UserDAO;

/**
 * Servlet implementation class AllProducts
 */
public class AllProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;

	private ProductDAO productDAO;
	 private UserDAO userDAO;

	@Override
	public void init() throws ServletException {
		productDAO = new ProductDAO(dataSource);
		userDAO = new UserDAO(dataSource);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AllProducts() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// HttpSession session = request.getSession(false);
		User user = (User) request.getSession().getAttribute("user");
		// User user = (User) session.getAttribute("user");
		if (user != null) {
			List<Product> productList = this.productDAO.getAllProducts();
			request.setAttribute("productList", productList);
			RequestDispatcher rd = request.getRequestDispatcher("showroom.jsp");
			rd.forward(request, response);

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
