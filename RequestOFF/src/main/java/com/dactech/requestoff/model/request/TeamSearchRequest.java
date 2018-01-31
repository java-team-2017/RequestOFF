package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TeamSearchRequest {
	private String id;
	private String name;
	@JsonProperty("name_match_status")
	private String nameMatchStatus;
	@JsonProperty("leader_id")
	private String leaderId;
	@JsonProperty("department_id")
	private String departmentId;
	@JsonProperty("valid_flag")
	private String validFlag;

	public TeamSearchRequest() {
	}

	public TeamSearchRequest(String id, String name, String nameMatchStatus, String leaderId, String departmentId,
			String validFlag) {
		super();
		this.id = id;
		this.name = name;
		this.nameMatchStatus = nameMatchStatus;
		this.leaderId = leaderId;
		this.departmentId = departmentId;
		this.validFlag = validFlag;
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

	public String getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

}
