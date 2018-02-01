package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DepartmentRegistRequest {
	private String id;
	private String name;
	@JsonProperty("manager_id")
	private String managerId;
	@JsonProperty("valid_flag")
	private String validFlag;
	@JsonProperty("update_date")
	private String updateDate;

	public DepartmentRegistRequest() {
		super();
	}

	public DepartmentRegistRequest(String id, String name, String managerId, String validFlag, String updateDate) {
		super();
		this.id = id;
		this.name = name;
		this.managerId = managerId;
		this.validFlag = validFlag;
		this.updateDate = updateDate;
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

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
