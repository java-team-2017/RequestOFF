package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TeamSearchRequest {
	private long id;
	private String name;
	@JsonProperty("name_match_status")
	private int nameMatchStatus;
	@JsonProperty("leader_id")
	private long leaderId;
	@JsonProperty("department_id")
	private long departmentId;
	@JsonProperty("valid_flag")
	private long validFlag;

	public TeamSearchRequest() {
	}

	public TeamSearchRequest(long id, String name, int nameMatchStatus, long leaderId, long departmentId,
			long validFlag) {
		super();
		this.id = id;
		this.name = name;
		this.nameMatchStatus = nameMatchStatus;
		this.leaderId = leaderId;
		this.departmentId = departmentId;
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

	public long getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(long validFlag) {
		this.validFlag = validFlag;
	}

}
