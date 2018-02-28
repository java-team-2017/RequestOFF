package com.dactech.requestoff.model.request;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TeamRegistRequest {
	private String id;
	private String name;
	@JsonProperty("leader_id")
	private String leaderId;
	@JsonProperty("department_id")
	private String departmentId;
	@JsonProperty("update_date")
	private String updateDate;
	@JsonProperty("valid_flag")
	private String validFlag;
	@JsonProperty("list_member")
	private List<String> listMember;

	public TeamRegistRequest() {
	}

	public TeamRegistRequest(String id, String name, String leaderId, String departmentId, String updateDate,
			String validFlag, List<String> listMember) {
		super();
		this.id = id;
		this.name = name;
		this.leaderId = leaderId;
		this.departmentId = departmentId;
		this.updateDate = updateDate;
		this.validFlag = validFlag;
		this.listMember = listMember;
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

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

	public List<String> getListMember() {
		return listMember;
	}

	public void setListMember(List<String> listMember) {
		this.listMember = listMember;
	}

}
