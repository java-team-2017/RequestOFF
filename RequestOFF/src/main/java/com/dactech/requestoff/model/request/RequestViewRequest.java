package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RequestViewRequest {
	@JsonProperty("user_id")
	private String userId;
	@JsonProperty("employee_name")
	private String employeeName;
	private String status;
	@JsonProperty("from_time")
	private String fromTime;
	@JsonProperty("to_time")
	private String toTime;
	@JsonProperty("department_id")
	private String departmentId;
	@JsonProperty("team_id")
	private String teamId;

	public RequestViewRequest(String userId, String employeeName, String status, String fromTime, String toTime,
			String departmentId, String teamId) {
		this.userId = userId;
		this.employeeName = employeeName;
		this.status = status;
		this.fromTime = fromTime;
		this.toTime = toTime;
		this.departmentId = departmentId;
		this.teamId = teamId;
	}

	public RequestViewRequest() {
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

}
