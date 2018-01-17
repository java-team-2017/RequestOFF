package com.dactech.requestoff.model.request;

public class RequestDetailsRequest {
	private long id;

	public RequestDetailsRequest() {
		super();
	}

	public RequestDetailsRequest(long id) {
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
