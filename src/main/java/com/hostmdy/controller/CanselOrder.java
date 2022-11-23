package com.hostmdy.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.hostmdy.model.OrderDAO;
import com.hostmdy.model.ProductDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class CanselOrder
 */
public class CanselOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;

	private OrderDAO orderDAO;
	private ProductDAO productDAO;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		orderDAO = new OrderDAO(dataSource);
		productDAO = new ProductDAO(dataSource);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CanselOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()) {
			String id = request.getParameter("id");
			if(id != null) {
				//OrderDao orderDao = new OrderDao(DbCon.getConnection());
				orderDAO.cancelOrder(Integer.parseInt(id));
			}
			response.sendRedirect("userproduct");
		} 
		
		
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("user");
//		request.setAttribute("user", user);
//		if (user != null) {
//
//			session = request.getSession();
//			user = (User) session.getAttribute("user");
//			request.setAttribute("user", user);
//			int id = Integer.parseInt(request.getParameter("id"));
//			if (id != 0) {
//				int roweffectedd = this.orderDAO.cancelOrder((id));
//				if (roweffectedd > 0) {
//					response.sendRedirect("userproduct");
//
//				}
//			}
//
//		} else {
//			response.sendRedirect("login");
//		}
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
