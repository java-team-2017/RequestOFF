package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeOffStatusSearchRequest {
	@JsonProperty("year_id")
	private String yearId;
	@JsonProperty("employee_id")
	private String employeeId;
	@JsonProperty("remain_hours")
	private String remainHours;
	@JsonProperty("total_hours")
	private String totalHours;
	@JsonProperty("valid_flag")
	private String validFlag;

	public EmployeeOffStatusSearchRequest() {
	}

	public EmployeeOffStatusSearchRequest(String yearId, String employeeId, String remainHours, String totalHours,
			String validFlag) {
		this.yearId = yearId;
		this.employeeId = employeeId;
		this.remainHours = remainHours;
		this.totalHours = totalHours;
		this.validFlag = validFlag;
	}

	public String getYearId() {
		return yearId;
	}

	public void setYearId(String yearId) {
		this.yearId = yearId;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getRemainHours() {
		return remainHours;
	}

	public void setRemainHours(String remainHours) {
		this.remainHours = remainHours;
	}

	public String getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(String totalHours) {
		this.totalHours = totalHours;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

}
