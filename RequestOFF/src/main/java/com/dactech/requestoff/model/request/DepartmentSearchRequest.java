package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DepartmentSearchRequest {
	private String id;
	private String name;
	@JsonProperty("name_match_status")
	private String nameMatchStatus;
	@JsonProperty("manager_id")
	private String managerId;
	@JsonProperty("valid_flag")
	private String validFlag;
	@JsonProperty("name_of_employee")
	private String nameOfEmployee;

	public DepartmentSearchRequest() {
		super();
	}

	public DepartmentSearchRequest(String id, String name, String nameMatchStatus, String managerId, String validFlag,
			String nameOfEmployee) {
		this.id = id;
		this.name = name;
		this.nameMatchStatus = nameMatchStatus;
		this.managerId = managerId;
		this.validFlag = validFlag;
		this.nameOfEmployee = nameOfEmployee;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameMatchStatus() {
		return nameMatchStatus;
	}

	public void setNameMatchStatus(String nameMatchStatus) {
		this.nameMatchStatus = nameMatchStatus;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

	public String getNameOfEmployee() {
		return nameOfEmployee;
	}

	public void setNameOfEmployee(String nameOfEmployee) {
		this.nameOfEmployee = nameOfEmployee;
	}

}
