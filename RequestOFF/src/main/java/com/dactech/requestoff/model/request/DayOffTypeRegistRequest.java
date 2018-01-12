package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DayOffTypeRegistRequest {

	private int id;
	@JsonProperty("name")
	private String nameDayOffType;
	@JsonProperty("payment_flag")
	private int paymentFlag;

	public DayOffTypeRegistRequest() {
		super();
	}

	public DayOffTypeRegistRequest(int id, String nameDayOffType, int paymentFlag) {
		super();
		this.id = id;
		this.nameDayOffType = nameDayOffType;
		this.paymentFlag = paymentFlag;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameDayOffType() {
		return nameDayOffType;
	}

	public void setNameDayOffType(String nameDayOffType) {
		this.nameDayOffType = nameDayOffType;
	}

	public int getPaymentFlag() {
		return paymentFlag;
	}

	public void setPaymentFlag(int paymentFlag) {
		this.paymentFlag = paymentFlag;
	}

}
