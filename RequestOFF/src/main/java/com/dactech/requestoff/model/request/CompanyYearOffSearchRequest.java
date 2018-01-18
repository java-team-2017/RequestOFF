package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CompanyYearOffSearchRequest {
	private long id;
	@JsonProperty("day_off_reset_flag")
	private int dayOffResetFlag;
	@JsonProperty("current_year_flag")
	private int currentYearFlag;
	@JsonProperty("valid_flag")
	private int validFlag;

	public CompanyYearOffSearchRequest() {
		super();
	}

	public CompanyYearOffSearchRequest(long id, int dayOffResetFlag, int currentYearFlag, int validFlag) {
		super();
		this.id = id;
		this.dayOffResetFlag = dayOffResetFlag;
		this.currentYearFlag = currentYearFlag;
		this.validFlag = validFlag;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getDayOffResetFlag() {
		return dayOffResetFlag;
	}

	public void setDayOffResetFlag(int dayOffResetFlag) {
		this.dayOffResetFlag = dayOffResetFlag;
	}

	public int getCurrentYearFlag() {
		return currentYearFlag;
	}

	public void setCurrentYearFlag(int currentYearFlag) {
		this.currentYearFlag = currentYearFlag;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

}
