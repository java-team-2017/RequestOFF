package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TeamRegistRequest {
	private long id;
	private String name;
	@JsonProperty("leader_id")
	private long leaderId;
	@JsonProperty("department_id")
	private long departmentId;
	@JsonProperty("update_date")
	private String updateDate;
	@JsonProperty("valid_flag")
	private int validFlag;

	public TeamRegistRequest() {
	}

	public TeamRegistRequest(long id, String name, long leaderId, long departmentId, String updateDate, int validFlag) {
		super();
		this.id = id;
		this.name = name;
		this.leaderId = leaderId;
		this.departmentId = departmentId;
		this.updateDate = updateDate;
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

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

}
