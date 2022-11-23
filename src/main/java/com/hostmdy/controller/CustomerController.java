package com.hostmdy.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.model.User;
import com.hostmdy.model.Customer;
import com.hostmdy.model.CustomerDAO;

/**
 * Servlet implementation class weaponController
 */
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/weaponname")
	private DataSource dataSource;

	private CustomerDAO customerDAO;

	@Override
	public void init() throws ServletException {
		customerDAO = new CustomerDAO(dataSource);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerController() {
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
			String mode = request.getParameter("mode");
			if (mode == null) {
				mode = "LIST";
			}

			switch (mode) {
			case "LIST":
				showResultList(request, response);
				break;
			case "LOAD":
				loadResult(request, response);
				break;
			case "SHOW":
				showCustomer(request, response);
				break;
			case "CREATE":
				createResult(request, response);
				break;
			case "UPDATE":
				updateResult(request, response);
				break;
			case "DELETE":
				deleteResult(request, response);
				break;
			case "LOGOUT":
				session.invalidate();
				response.sendRedirect("login");
				break;

			default:
				showResultList(request, response);
				break;
			}

		} else {
			response.sendRedirect("login");
		}

	}

	private void showResultList(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		List<Customer> customerList = this.customerDAO.customerList();
		request.setAttribute("customerList", customerList);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);

	}

	private void showCustomer(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int ID = Integer.parseInt(request.getParameter("voucherNo"));
		Customer customer = this.customerDAO.getCustomer(ID);
		request.setAttribute("customer", customer);

		RequestDispatcher rd = request.getRequestDispatcher("userinfo.jsp");
		rd.forward(request, response);

	}

	private void loadResult(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int voucherNo = Integer.parseInt(request.getParameter("voucherNo"));
		Customer customer = this.customerDAO.getCustomer(voucherNo);
		request.setAttribute("customer", customer);
		RequestDispatcher rd = request.getRequestDispatcher("result-update.jsp");
		rd.forward(request, response);
	}

	private void createResult(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		String date = request.getParameter("date");
		String name = request.getParameter("name");
		String phNo = request.getParameter("phNo");
		String device = request.getParameter("device");
		String model = request.getParameter("model");
		String error = request.getParameter("error");
		Customer customer = new Customer(date, name, phNo, device, model, error);
		int rowEffectd = this.customerDAO.createdCustomer(customer);

		if (rowEffectd > 0)
			showResultList(request, response);

	}

	private void updateResult(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int voucherNo = Integer.parseInt(request.getParameter("voucherNo"));
		String date = request.getParameter("date");
		String name = request.getParameter("name");
		String phNo = request.getParameter("phNo");
		String device = request.getParameter("device");
		String model = request.getParameter("model");
		String error = request.getParameter("error");

		Customer customer = new Customer(voucherNo, date, name, phNo, device, model, error);
		int rowEffected = this.customerDAO.updateCustomer(customer);
		if (rowEffected > 0)
			showResultList(request, response);
	}

	private void deleteResult(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		request.setAttribute("user", user);
		int ID = Integer.parseInt(request.getParameter("voucherNo"));
		int rowEffectd = this.customerDAO.deleteCustomer(ID);

		if (rowEffectd > 0)
			showResultList(request, response);
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
