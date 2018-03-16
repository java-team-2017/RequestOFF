package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeChangePasswordRequest {
	private String id;
	@JsonProperty("old_password")
	private String oldPassword;
	@JsonProperty("new_password")
	private String newPassword;

	public EmployeeChangePasswordRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmployeeChangePasswordRequest(String id, String oldPassword, String newPassword) {
		super();
		this.id = id;
		this.oldPassword = oldPassword;
		this.newPassword = newPassword;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

}
