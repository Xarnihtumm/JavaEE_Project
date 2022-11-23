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
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.hostmdy.model.Cart;
import com.hostmdy.model.ProductDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class RemovefromCart
 */
public class RemovefromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;

	private RemovefromCart removefromcart;
	
	public void init() throws ServletException {
		removefromcart = new RemovefromCart();
		// TODO Auto-generated method stub

	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemovefromCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		if(user != null) {
		try (PrintWriter out = response.getWriter()) {
			String bookId = request.getParameter("id");
			if (bookId != null) {
				ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cartList");
				if (cart_list != null) {
					for (Cart c : cart_list) {
						if (c.getId() == Integer.parseInt(bookId)) {
							cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
				}
				//RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				//rd.forward(request, response);
				response.sendRedirect("card");

			} else {
				//RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				//rd.forward(request, response);
				response.sendRedirect("card");
			}
		
		
		 
	}
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
