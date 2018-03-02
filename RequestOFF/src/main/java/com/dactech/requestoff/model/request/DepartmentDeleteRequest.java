package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DepartmentDeleteRequest {
	@JsonProperty("department_id")
	private String departmentId;

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public DepartmentDeleteRequest(String departmentId) {
		this.departmentId = departmentId;
	}

	public DepartmentDeleteRequest() {
	}

}
