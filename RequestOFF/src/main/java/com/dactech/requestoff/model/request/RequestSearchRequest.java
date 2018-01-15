package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RequestSearchRequest {
	private long id;
	@JsonProperty("employee_id")
	private long employeeId;
	@JsonProperty("from_time")
	private String fromTime;
	@JsonProperty("to_time")
	private String toTime;
	private String reason;
	private long status;
	@JsonProperty("response_message")
	private String responseMessage;
	@JsonProperty("day_off_type_id")
	private long dayOffTypeId;
	@JsonProperty("recipient_id")
	private long recipientId;
	@JsonProperty("valid_flag")
	private long validFlag;

	public RequestSearchRequest() {
		super();
	}

	public RequestSearchRequest(long id, long employeeId, String fromTime, String toTime, String reason, long status,
			String responseMessage, long dayOffTypeId, long recipientId, long validFlag) {
		super();
		this.id = id;
		this.employeeId = employeeId;
		this.fromTime = fromTime;
		this.toTime = toTime;
		this.reason = reason;
		this.status = status;
		this.responseMessage = responseMessage;
		this.dayOffTypeId = dayOffTypeId;
		this.recipientId = recipientId;
		this.validFlag = validFlag;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public long getStatus() {
		return status;
	}

	public void setStatus(long status) {
		this.status = status;
	}

	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	public long getDayOffTypeId() {
		return dayOffTypeId;
	}

	public void setDayOffTypeId(long dayOffTypeId) {
		this.dayOffTypeId = dayOffTypeId;
	}

	public long getRecipientId() {
		return recipientId;
	}

	public void setRecipientId(long recipientId) {
		this.recipientId = recipientId;
	}

	public long getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(long validFlag) {
		this.validFlag = validFlag;
	}

}
