package com.dactech.requestoff.model.request;

public class EmployeeDetailsRequest {
	private long id;

	public EmployeeDetailsRequest() {
		super();
	}

	public EmployeeDetailsRequest(long id) {
		super();
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
