package com.dactech.requestoff.model.request;

public class EmployeeDeleteRequest {
	private String id;

	public EmployeeDeleteRequest() {
		super();
	}

	public EmployeeDeleteRequest(String id) {
		super();
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
