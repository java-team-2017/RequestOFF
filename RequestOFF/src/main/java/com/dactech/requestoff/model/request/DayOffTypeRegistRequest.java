package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DayOffTypeRegistRequest {

	private int id;
	@JsonProperty("name")
	private String nameDayOffType;
	@JsonProperty("payment_flag")
	private int paymentFlag;
	@JsonProperty("valid_flag")
	private int validFlag;
	@JsonProperty("update_date")
	private String updateDate;

	public DayOffTypeRegistRequest() {
		super();
	}

	public DayOffTypeRegistRequest(int id, String nameDayOffType, int paymentFlag, int validFlag, String updateDate) {
		this.id = id;
		this.nameDayOffType = nameDayOffType;
		this.paymentFlag = paymentFlag;
		this.validFlag = validFlag;
		this.updateDate = updateDate;
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

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
