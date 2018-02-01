package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CompanyYearOffSearchRequest {
	private String id;
	@JsonProperty("day_off_reset_flag")
	private String dayOffResetFlag;
	@JsonProperty("current_year_flag")
	private String currentYearFlag;
	@JsonProperty("valid_flag")
	private String validFlag;

	public CompanyYearOffSearchRequest() {
		super();
	}

	public CompanyYearOffSearchRequest(String id, String dayOffResetFlag, String currentYearFlag, String validFlag) {
		super();
		this.id = id;
		this.dayOffResetFlag = dayOffResetFlag;
		this.currentYearFlag = currentYearFlag;
		this.validFlag = validFlag;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDayOffResetFlag() {
		return dayOffResetFlag;
	}

	public void setDayOffResetFlag(String dayOffResetFlag) {
		this.dayOffResetFlag = dayOffResetFlag;
	}

	public String getCurrentYearFlag() {
		return currentYearFlag;
	}

	public void setCurrentYearFlag(String currentYearFlag) {
		this.currentYearFlag = currentYearFlag;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

}
