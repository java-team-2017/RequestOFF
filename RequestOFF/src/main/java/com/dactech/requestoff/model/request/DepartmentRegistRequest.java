package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DepartmentRegistRequest {
	private long id;
	private String name;
	@JsonProperty("manager_id")
	private long managerId;
	@JsonProperty("valid_flag")
	private int validFlag;
	@JsonProperty("update_date")
	private String updateDate;

	public DepartmentRegistRequest() {
		super();
	}

	public DepartmentRegistRequest(long id, String name, long managerId, int validFlag, String updateDate) {
		super();
		this.id = id;
		this.name = name;
		this.managerId = managerId;
		this.validFlag = validFlag;
		this.updateDate = updateDate;
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

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
