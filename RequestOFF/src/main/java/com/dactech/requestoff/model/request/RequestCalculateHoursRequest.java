package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RequestCalculateHoursRequest {
	@JsonProperty("from_time")
	private String fromTime;
	@JsonProperty("to_time")
	private String toTime;

	public RequestCalculateHoursRequest() {
		super();
	}

	public RequestCalculateHoursRequest(String fromTime, String toTime) {
		super();
		this.fromTime = fromTime;
		this.toTime = toTime;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

}
