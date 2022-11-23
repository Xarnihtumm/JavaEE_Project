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
import com.hostmdy.model.Order;
import com.hostmdy.model.OrderDAO;
import com.hostmdy.model.ProductDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class UserProducts
 */
public class UserProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;

	private OrderDAO orderDAO;
	private ProductDAO productDAO;
	

	@Override
	public void init() throws ServletException {
		orderDAO = new OrderDAO(dataSource);
		productDAO =new ProductDAO(dataSource);}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) request.getSession().getAttribute("user");
		DecimalFormat dcf = new DecimalFormat("#.##");
		request.setAttribute("dcf", dcf);
		List<Order> orders = null;
		if (user != null) {
			int id = user.getId();
			orders = this.orderDAO.userOrder(id);

		} else {
			response.sendRedirect("login.jsp");
		}
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cartList");
		if (cart_list != null) {
			request.setAttribute("cart_list", cart_list);
			request.setAttribute("orders", orders);
			RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
			rd.forward(request, response);
		}

	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
