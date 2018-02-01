package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeOffStatusDetailsRequest {
	@JsonProperty("year_id")
	private String yearId;
	@JsonProperty("employee_id")
	private String employeeId;

	public EmployeeOffStatusDetailsRequest() {
		super();
	}

	public EmployeeOffStatusDetailsRequest(String yearId, String employeeId) {
		super();
		this.yearId = yearId;
		this.employeeId = employeeId;
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

}
