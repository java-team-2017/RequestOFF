package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CompanyYearOffRegistRequest {
	@JsonProperty("day_off_reset_flag")
	private String dayOffResetFlag;
	@JsonProperty("number_day_off")
	private String numberDayOff;
	@JsonProperty("current_year_flag")
	private String currentYearFlag;
	@JsonProperty("valid_flag")
	private String validFlag;
	@JsonProperty("update_date")
	private String updateDate;

	public CompanyYearOffRegistRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompanyYearOffRegistRequest(String dayOffResetFlag, String numberDayOff, String currentYearFlag,
			String validFlag, String updateDate) {
		super();
		this.dayOffResetFlag = dayOffResetFlag;
		this.numberDayOff = numberDayOff;
		this.currentYearFlag = currentYearFlag;
		this.validFlag = validFlag;
		this.updateDate = updateDate;
	}

	public String getDayOffResetFlag() {
		return dayOffResetFlag;
	}

	public void setDayOffResetFlag(String dayOffResetFlag) {
		this.dayOffResetFlag = dayOffResetFlag;
	}

	public String getNumberDayOff() {
		return numberDayOff;
	}

	public void setNumberDayOff(String numberDayOff) {
		this.numberDayOff = numberDayOff;
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

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
