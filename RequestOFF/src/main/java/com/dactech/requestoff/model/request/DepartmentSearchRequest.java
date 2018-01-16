package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DepartmentSearchRequest {
	private long id;
	private String name;
	@JsonProperty("name_match_status")
	private int nameMatchStatus;
	@JsonProperty("manager_id")
	private long managerId;
	@JsonProperty("valid_flag")
	private int validFlag;

	public DepartmentSearchRequest() {
		super();
	}

	public DepartmentSearchRequest(long id, String name, int nameMatchStatus, long managerId, int validFlag) {
		super();
		this.id = id;
		this.name = name;
		this.nameMatchStatus = nameMatchStatus;
		this.managerId = managerId;
		this.validFlag = validFlag;
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

	public int getNameMatchStatus() {
		return nameMatchStatus;
	}

	public void setNameMatchStatus(int nameMatchStatus) {
		this.nameMatchStatus = nameMatchStatus;
	}

	public long getManagerId() {
		return managerId;
	}

	public void setManagerId(long managerId) {
		this.managerId = managerId;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

}
