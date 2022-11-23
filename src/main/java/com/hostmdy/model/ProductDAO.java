package com.hostmdy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import jakarta.annotation.Resource;

public class ProductDAO {

	@Resource(name = "jdbc/weaponname")
	private final DataSource dataSource;

	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;

	public ProductDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public ProductDAO() {
		this.dataSource = null;

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

	public List<Product> getAllProducts() {
		List<Product> productList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from product;");

			while (rs.next()) {
				productList.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("category"),
						rs.getDouble("prices"), rs.getString("pImg")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();

		}
		return productList;
	}

	public Product getSingleProduct(int id) {
		Product product = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from product where id ='" + id + "';");

			while (rs.next()) {
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setCategory(rs.getString("category"));
				product.setPrice(rs.getDouble("prices"));
				product.setImage(rs.getString("pImg"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return product;

	}

	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum = 0;

		try {
			if (cartList.size() > 0) {

				for (Cart item : cartList) {

					connection = dataSource.getConnection();
					pStmt = connection.prepareStatement("select * from product where id = ?;");
					pStmt.setInt(1, item.getId());
					rs = pStmt.executeQuery();
					while (rs.next()) {

						sum += rs.getDouble("prices") * item.getQuantity();
					}
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return sum;
	}

	public List<Cart> getCartProduct(ArrayList<Cart> cartList) {

		List<Cart> shoppingcart = new ArrayList<>();

		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {

					connection = dataSource.getConnection();
					pStmt = connection.prepareStatement("select * from product where id = ?;");
					pStmt.setInt(1, item.getId());
					rs = pStmt.executeQuery();
					while (rs.next()) {
						Cart cart = new Cart();
						cart.setId(rs.getInt("id"));
						cart.setId(rs.getInt("id"));
						cart.setName(rs.getString("name"));
						cart.setCategory(rs.getString("category"));

						cart.setPrice(rs.getDouble("prices") * item.getQuantity());
						cart.setQuantity(item.getQuantity());
						shoppingcart.add(cart);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return shoppingcart;
	}

}
