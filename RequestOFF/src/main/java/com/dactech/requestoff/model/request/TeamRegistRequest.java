package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TeamRegistRequest {
	private long id;
	private String name;
	@JsonProperty("leader_id")
	private long leaderId;
	@JsonProperty("department_id")
	private long departmentId;

	public TeamRegistRequest() {
	}

	public TeamRegistRequest(long id, String name, long leaderId, long departmentId) {
		super();
		this.id = id;
		this.name = name;
		this.leaderId = leaderId;
		this.departmentId = departmentId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(long leaderId) {
		this.leaderId = leaderId;
	}

	public long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(long departmentId) {
		this.departmentId = departmentId;
	}

}
