package com.dactech.requestoff.model.request;

public class RequestDetailRequest {
	private long id;

	public RequestDetailRequest() {
		super();
	}

	public RequestDetailRequest(long id) {
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
