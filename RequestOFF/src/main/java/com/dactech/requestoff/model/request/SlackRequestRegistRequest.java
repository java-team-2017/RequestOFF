package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SlackRequestRegistRequest {
	private String id;
	@JsonProperty("msg_user_id")
	private String msgUserId;
	private String name;
	@JsonProperty("msg_content")
	private String msgContent;
	@JsonProperty("msg_time")
	private String msgTime;
	@JsonProperty("day_off_from")
	private String dayOffFrom;
	@JsonProperty("day_off_to")
	private String dayOffTo;
	@JsonProperty("total_hours")
	private String totalHours;
	private String reason;
	@JsonProperty("process_flag")
	private String processFlag;
	@JsonProperty("is_valid_msg")
	private String isValidMsg;
	@JsonProperty("err_msg")
	private String errMsg;
	@JsonProperty("valid_flag")
	private String validFlag;
	@JsonProperty("update_date")
	private String updateDate;

	public SlackRequestRegistRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SlackRequestRegistRequest(String id, String msgUserId, String name, String msgContent, String msgTime,
			String dayOffFrom, String dayOffTo, String totalHours, String reason, String processFlag, String isValidMsg,
			String errMsg, String validFlag, String updateDate) {
		super();
		this.id = id;
		this.msgUserId = msgUserId;
		this.name = name;
		this.msgContent = msgContent;
		this.msgTime = msgTime;
		this.dayOffFrom = dayOffFrom;
		this.dayOffTo = dayOffTo;
		this.totalHours = totalHours;
		this.reason = reason;
		this.processFlag = processFlag;
		this.isValidMsg = isValidMsg;
		this.errMsg = errMsg;
		this.validFlag = validFlag;
		this.updateDate = updateDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsgUserId() {
		return msgUserId;
	}

	public void setMsgUserId(String msgUserId) {
		this.msgUserId = msgUserId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(String msgTime) {
		this.msgTime = msgTime;
	}

	public String getDayOffFrom() {
		return dayOffFrom;
	}

	public void setDayOffFrom(String dayOffFrom) {
		this.dayOffFrom = dayOffFrom;
	}

	public String getDayOffTo() {
		return dayOffTo;
	}

	public void setDayOffTo(String dayOffTo) {
		this.dayOffTo = dayOffTo;
	}

	public String getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(String totalHours) {
		this.totalHours = totalHours;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getProcessFlag() {
		return processFlag;
	}

	public void setProcessFlag(String processFlag) {
		this.processFlag = processFlag;
	}

	public String getIsValidMsg() {
		return isValidMsg;
	}

	public void setIsValidMsg(String isValidMsg) {
		this.isValidMsg = isValidMsg;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
