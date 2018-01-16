package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.common.StatusInfo;
import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeOffStatusRegistResponse extends Common {
	@JsonProperty("year_id")
	private long yearId;
	@JsonProperty("employee_id")
	private long employeeId;

	public EmployeeOffStatusRegistResponse() {
		super();
	}

	public EmployeeOffStatusRegistResponse(StatusInfo statusInfo) {
		super(statusInfo);
	}

	public EmployeeOffStatusRegistResponse(long yearId, long employeeId) {
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
