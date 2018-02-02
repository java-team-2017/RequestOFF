package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DayOffTypeRegistRequest {

	private String id;
	@JsonProperty("name")
	private String nameDayOffType;
	@JsonProperty("payment_flag")
	private String paymentFlag;
	@JsonProperty("valid_flag")
	private String validFlag;
	@JsonProperty("update_date")
	private String updateDate;

	public DayOffTypeRegistRequest() {
	}

	public DayOffTypeRegistRequest(String id, String nameDayOffType, String paymentFlag, String validFlag,
			String updateDate) {
		this.id = id;
		this.nameDayOffType = nameDayOffType;
		this.paymentFlag = paymentFlag;
		this.validFlag = validFlag;
		this.updateDate = updateDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNameDayOffType() {
		return nameDayOffType;
	}

	public void setNameDayOffType(String nameDayOffType) {
		this.nameDayOffType = nameDayOffType;
	}

	public String getPaymentFlag() {
		return paymentFlag;
	}

	public void setPaymentFlag(String paymentFlag) {
		this.paymentFlag = paymentFlag;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
