package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class RequestSearchRequest {
	private String id;
	@JsonProperty("employee_id")
	private String employeeId;
	@JsonProperty("from_time")
	private String fromTime;
	@JsonProperty("to_time")
	private String toTime;
	private String reason;
	private String status;
	@JsonProperty("response_message")
	private String responseMessage;
	@JsonProperty("day_off_type_id")
	private String dayOffTypeId;
	@JsonProperty("recipient_id")
	private String recipientId;
	@JsonProperty("valid_flag")
	private String validFlag;

	public RequestSearchRequest() {
		super();
	}

	public RequestSearchRequest(String id, String employeeId, String fromTime, String toTime, String reason,
			String status, String responseMessage, String dayOffTypeId, String recipientId, String validFlag) {
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	public String getDayOffTypeId() {
		return dayOffTypeId;
	}

	public void setDayOffTypeId(String dayOffTypeId) {
		this.dayOffTypeId = dayOffTypeId;
	}

	public String getRecipientId() {
		return recipientId;
	}

	public void setRecipientId(String recipientId) {
		this.recipientId = recipientId;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

}
