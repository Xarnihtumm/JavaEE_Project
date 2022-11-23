package com.hostmdy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import jakarta.annotation.Resource;

public class OrderDAO {
	@Resource(name = "jdbc/weaponname")
	private final DataSource dataSource;
	private Connection connection;
	private PreparedStatement pStmt;
	private ResultSet rs;
	// ProductDAO productDAO = new ProductDAO(dataSource);

	public OrderDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	private void close() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public boolean insertOrder(Order order) {

		boolean result = false;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement(
					"INSERT INTO `order`" + " (`pid`, `uid`, `quantity`, `date`)" + " VALUES (?, ?, ?, ?);");

			pStmt.setInt(1, order.getId());
			pStmt.setInt(2, order.getUid());
			pStmt.setInt(3, order.getQunatity());
			pStmt.setString(4, order.getDate());
			pStmt.executeUpdate();
			result = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public List<Order> userOrder(int id) {

		List<Order> orderList = new ArrayList<>();

		try {
			ProductDAO productDAO = new ProductDAO(dataSource);
			connection = dataSource.getConnection();
			pStmt = connection
					.prepareStatement("SELECT * FROM customer_service.order where uid=? order by orderID desc;");

			pStmt.setInt(1, id);
			rs = pStmt.executeQuery();
			while (rs.next()) {
				Order order = new Order();

				int pId = rs.getInt("pid");
				Product product = productDAO.getSingleProduct(pId);
				order.setOrderId(rs.getInt("orderId"));
				order.setUid(pId);
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setPrice(product.getPrice() * rs.getInt("quantity"));
				order.setQunatity(rs.getInt("quantity"));
				order.setDate(rs.getString("date"));

				orderList.add(order);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return orderList;

	}

	public int cancelOrder(int id) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement(
					/* "delete from order where orderId = ?; */"delete from customer_service.order where orderId = ?;");
			pStmt.setInt(1, id);
			// pStmt.executeUpdate();
			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		// return rowEffected;
		return rowEffected;
		

	}

}
