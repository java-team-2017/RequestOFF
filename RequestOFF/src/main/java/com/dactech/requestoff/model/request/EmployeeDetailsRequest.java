package com.dactech.requestoff.model.request;

public class EmployeeDetailsRequest {
	private String id;

	public EmployeeDetailsRequest() {
	}

	public EmployeeDetailsRequest(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
