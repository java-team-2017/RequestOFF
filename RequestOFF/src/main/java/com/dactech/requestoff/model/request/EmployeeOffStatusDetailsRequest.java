package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeOffStatusDetailsRequest {
	@JsonProperty("year_id")
	private long yearId;
	@JsonProperty("employee_id")
	private long employeeId;

	public EmployeeOffStatusDetailsRequest() {
		super();
	}

	public EmployeeOffStatusDetailsRequest(long yearId, long employeeId) {
		super();
		this.yearId = yearId;
		this.employeeId = employeeId;
	}

	public long getYearId() {
		return yearId;
	}

	public void setYearId(long yearId) {
		this.yearId = yearId;
	}

	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}

}
