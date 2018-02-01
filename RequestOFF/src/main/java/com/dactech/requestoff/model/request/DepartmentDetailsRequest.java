package com.dactech.requestoff.model.request;

public class DepartmentDetailsRequest {
	private String id;

	public DepartmentDetailsRequest() {
		super();
	}

	public DepartmentDetailsRequest(String id) {
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
