package com.hostmdy.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 * Servlet implementation class CheckOut
 */
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;

	private OrderDAO orderDAO;
	private ProductDAO productDAO;
	
	@Override
	public void init() throws ServletException {
		orderDAO = new OrderDAO(dataSource);
		productDAO =new ProductDAO(dataSource);
		
		
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cartList");
			User user = (User) request.getSession().getAttribute("user");
			if(cart_list != null && user!=null) {
				for(Cart c:cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setUid(user.getId());
					order.setQunatity(c.getQuantity());
					order.setDate(formatter.format(date));
					//
					OrderDAO orderDAO = new OrderDAO(dataSource);
					boolean result = orderDAO.insertOrder(order);
					if(!result) break;
				}
				cart_list.clear();
				response.sendRedirect("userproduct");
			}else {
				if(user==null) {
					response.sendRedirect("login");
				}
				response.sendRedirect("card");
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
