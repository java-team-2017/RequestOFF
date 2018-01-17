package com.dactech.requestoff.model.request;

public class DepartmentDetailsRequest {
	private long id;

	public DepartmentDetailsRequest() {
		super();
	}

	public DepartmentDetailsRequest(long id) {
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
