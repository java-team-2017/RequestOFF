package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;

public class PositionRegistResponse extends Common {
	private long id;

	public PositionRegistResponse() {
		super();
	}

	public PositionRegistResponse(long id) {
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
