package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RequestViewRequest {
	@JsonProperty("user_id")
	private String userId;
	private String name;
	private String status;
	@JsonProperty("from_time")
	private String fromTime;
	@JsonProperty("to_time")
	private String toTime;

	public RequestViewRequest(String userId, String name, String status, String fromTime, String toTime) {
		this.userId = userId;
		this.name = name;
		this.status = status;
		this.fromTime = fromTime;
		this.toTime = toTime;
	}

	public RequestViewRequest() {
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
