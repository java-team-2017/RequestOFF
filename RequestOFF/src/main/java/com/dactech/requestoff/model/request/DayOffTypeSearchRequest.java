package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DayOffTypeSearchRequest {
	private long id;
	private String name;
	@JsonProperty("name_match_status")
	private int nameMatchStatus;
	@JsonProperty("payment_flag_id")
	private int paymentFlag;
	@JsonProperty("valid_flag_id")
	private int validFlag;

	public DayOffTypeSearchRequest() {
		super();
	}

	public DayOffTypeSearchRequest(long id, String name, int nameMatchStatus, int paymentFlag, int validFlag) {
		super();
		this.id = id;
		this.name = name;
		this.nameMatchStatus = nameMatchStatus;
		this.paymentFlag = paymentFlag;
		this.validFlag = validFlag;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNameMatchStatus() {
		return nameMatchStatus;
	}

	public void setNameMatchStatus(int nameMatchStatus) {
		this.nameMatchStatus = nameMatchStatus;
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

}
