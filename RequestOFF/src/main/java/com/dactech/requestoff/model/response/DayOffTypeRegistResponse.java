package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;

public class DayOffTypeRegistResponse extends Common {
	private long id;

	public DayOffTypeRegistResponse() {
	}

	public DayOffTypeRegistResponse(long id) {
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
