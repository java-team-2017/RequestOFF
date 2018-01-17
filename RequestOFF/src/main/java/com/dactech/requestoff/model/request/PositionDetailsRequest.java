package com.dactech.requestoff.model.request;

public class PositionDetailsRequest {
	private long id;

	public PositionDetailsRequest() {
		super();
	}

	public PositionDetailsRequest(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
