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
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.taglibs.standard.tag.rt.core.OutTag;

import com.hostmdy.model.Cart;
import com.hostmdy.model.CustomerDAO;
import com.hostmdy.model.ProductDAO;
import com.hostmdy.model.User;

/**
 * Servlet implementation class AddtoCart
 */
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;
	// ProductDAO productDAO;
	private AddtoCart addtocart;

	public AddtoCart(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	@Override
	public void init() throws ServletException {
		addtocart = new AddtoCart();
	}
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddtoCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param out
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		//request.setAttribute("user", user);
		//try (PrintWriter out = response.getWriter()) {
		if(user != null) {
		 
			ArrayList<Cart> cartList = new ArrayList<>();
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cartList");
			if (cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cartList", cartList);
				response.sendRedirect("product");
			} else {
				cartList = cart_list;

				boolean exist = false;
				for (Cart c : cart_list) {
					if (c.getId() == id) {
						exist = true;
						response.sendRedirect("message.jsp");
						// out.println("");
					}
				}

				if (!exist) {
					cartList.add(cm);

					response.sendRedirect("product");
				}
			}

		}else {
			response.sendRedirect("login");
		}

	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
