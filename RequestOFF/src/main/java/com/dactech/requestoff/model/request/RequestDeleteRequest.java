package com.dactech.requestoff.model.request;

public class RequestDeleteRequest {
	private long id;

	public RequestDeleteRequest(long id) {
		super();
		this.id = id;
	}

	public RequestDeleteRequest() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
