package com.hostmdy.model;

public class Customer {
	private int voucherNo;
	private String date;
	private String name;
	private String phNo;
	private String device;
	private String model;
	private String error;
	
	
	public Customer() {
		super();
	}


	public Customer(String date, String name, String phNo, String device, String model, String error) {
		super();
		this.date = date;
		this.name = name;
		this.phNo = phNo;
		this.device = device;
		this.model = model;
		this.error = error;
	}


	public Customer(int voucherNo, String date, String name, String phNo, String device, String model, String error) {
		super();
		this.voucherNo = voucherNo;
		this.date = date;
		this.name = name;
		this.phNo = phNo;
		this.device = device;
		this.model = model;
		this.error = error;
	}


	public int getVoucherNo() {
		return voucherNo;
	}


	public void setVoucherNo(int voucherNo) {
		this.voucherNo = voucherNo;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhNo() {
		return phNo;
	}


	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}


	public String getDevice() {
		return device;
	}


	public void setDevice(String device) {
		this.device = device;
	}


	public String getModel() {
		return model;
	}


	public void setModel(String model) {
		this.model = model;
	}


	public String getError() {
		return error;
	}


	public void setError(String error) {
		this.error = error;
	}


	@Override
	public String toString() {
		return "Customer [voucherNo=" + voucherNo + ", date=" + date + ", name=" + name + ", phNo=" + phNo + ", device="
				+ device + ", model=" + model + ", error=" + error + "]";
	}
	
	
	

}
