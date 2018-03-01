package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RoleSearchRequest {
	private String id;
	private String role;
	@JsonProperty("valid_flag")
	private String validFlag;

	public RoleSearchRequest() {
		super();
	}

	public RoleSearchRequest(String id, String role, String validFlag) {
		super();
		this.id = id;
		this.role = role;
		this.validFlag = validFlag;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

}
