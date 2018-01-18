package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeOffStatusSearchRequest {
	@JsonProperty("year_id")
	private long yearId;
	@JsonProperty("employee_id")
	private long employeeId;
	@JsonProperty("remain_hours")
	private long remainHours;
	@JsonProperty("total_hours")
	private long totalHours;
	@JsonProperty("valid_flag")
	private int validFlag;

	public EmployeeOffStatusSearchRequest() {
	}

	public EmployeeOffStatusSearchRequest(long yearId, long employeeId, long remainHours, long totalHours,
			int validFlag) {
		this.yearId = yearId;
		this.employeeId = employeeId;
		this.remainHours = remainHours;
		this.totalHours = totalHours;
		this.validFlag = validFlag;
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

	public long getRemainHours() {
		return remainHours;
	}

	public void setRemainHours(long remainHours) {
		this.remainHours = remainHours;
	}

	public long getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(long totalHours) {
		this.totalHours = totalHours;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

}
