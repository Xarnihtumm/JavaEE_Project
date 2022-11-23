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

public class CustomerDAO {
	@Resource(name = "jdbc/weaponname")
	private final DataSource dataSource;

	private Connection connection;
	private Statement stmt;
	private PreparedStatement pStmt;
	private ResultSet rs;

	public CustomerDAO(DataSource dataSource) {
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

	public List<Customer> customerList() {
		List<Customer> customerList = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from service;");

			while (rs.next()) {
				customerList.add(new Customer(
						rs.getInt("voucherNo"),
						rs.getString("date"),
						rs.getString("name"), 
						rs.getString("phNo"),
						rs.getString("device"), 
						rs.getString("model"),
						rs.getString("error")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();

		}
		return customerList;
	}

	public Customer getCustomer(int id ) {
		Customer customer = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(/*"select * from service where voucherNo ='" + id + "';"*/"SELECT * FROM customer_service.service WHERE voucherNo='" + id + "';");

			while (rs.next()) {
				customer = new Customer(rs.getInt("voucherNo"),
						rs.getString("date"),
						rs.getString("name"),
						rs.getString("phNo"),
						rs.getString("device"),
						rs.getString("model"),
						rs.getString("error"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return customer;

	}

	public int createdCustomer(final Customer customer) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			//pStmt= connection.prepareStatement("INSERT INTO `service` (`date`, `name`, `phNo`, `device`, `model`, `error`) VALUES (?, ?, ?, ?, ?, ?);");
			pStmt = connection.prepareStatement("INSERT INTO `service`"
					+ " (`date`, `name`, `phNo`, `device`, `model`, `error`)" 
					+ " VALUES (?, ?, ?, ?, ?,?);");
			
			pStmt.setString(1, customer.getDate());
			pStmt.setString(2, customer.getName());
			pStmt.setString(3, customer.getPhNo());
			pStmt.setString(4, customer.getDevice());
			pStmt.setString(5, customer.getModel());
			pStmt.setString(6, customer.getError());

			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return rowEffected;
	}

	public int updateCustomer(final Customer customer) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			
			pStmt = connection.prepareStatement(
					"UPDATE `service` SET "
					+ "`date` = ?, "
					+ "`name` = ?, "
					+ "`phNo` = ?, "
					+ "`device` = ?, "
					+ "`model` = ?, "
					+ "`error` = ? WHERE (`voucherNo` = ?);"
					);
			
			pStmt.setString(1, customer.getDate());
			pStmt.setString(2, customer.getName());
			pStmt.setString(3, customer.getPhNo());
			pStmt.setString(4, customer.getDevice());
			pStmt.setString(5, customer.getModel());
			pStmt.setString(6, customer.getError());
			pStmt.setInt(7, customer.getVoucherNo());
			
			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return rowEffected;

	}

	public int deleteCustomer(int ID) {
		int rowEffected = 0;
		try {
			connection = dataSource.getConnection();
			pStmt = connection.prepareStatement("delete from service where voucherNo = ?;");
			pStmt.setInt(1, ID);
			rowEffected = pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return rowEffected;

	}

}
