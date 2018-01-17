package com.dactech.requestoff.model.request;

public class TeamDetailsRequest {
	private long id;

	public TeamDetailsRequest() {
	}

	public TeamDetailsRequest(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
