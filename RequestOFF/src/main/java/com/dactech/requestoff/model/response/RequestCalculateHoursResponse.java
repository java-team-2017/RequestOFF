package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;

public class RequestCalculateHoursResponse extends Common {
	private String hours;

	public RequestCalculateHoursResponse() {
		super();
	}

	public RequestCalculateHoursResponse(String hours) {
		super();
		this.hours = hours;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

}
