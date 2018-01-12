package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;

public class TeamRegistResponse extends Common {
	private long id;

	public TeamRegistResponse() {
	}

	public TeamRegistResponse(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
}
