package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeOffStatisticsRequest {
	@JsonProperty("from_time")
	private String fromTime;
	@JsonProperty("to_time")
	private String toTime;
	@JsonProperty("department_id")
	private long departmentId;
	@JsonProperty("team_id")
	private long teamId;
	private String employee;

	public EmployeeOffStatisticsRequest() {
		super();
	}

	public EmployeeOffStatisticsRequest(String fromTime, String toTime, long departmentId, long teamId,
			String employee) {
		super();
		this.fromTime = fromTime;
		this.toTime = toTime;
		this.departmentId = departmentId;
		this.teamId = teamId;
		this.employee = employee;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

	public long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(long departmentId) {
		this.departmentId = departmentId;
	}

	public long getTeamId() {
		return teamId;
	}

	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}

	public String getEmployee() {
		return employee;
	}

	public void setEmployee(String employee) {
		this.employee = employee;
	}

}
