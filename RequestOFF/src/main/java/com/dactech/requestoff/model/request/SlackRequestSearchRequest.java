package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SlackRequestSearchRequest {
	@JsonProperty("msg_time_from")
	private String msgTimeFrom; // message time
	@JsonProperty("msg_time_to")
	private String msgTimeTo;
	@JsonProperty("is_valid_msg")
	private String isValidMsg;
	@JsonProperty("process_flag")
	private String processFlag;

	public SlackRequestSearchRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SlackRequestSearchRequest(String msgTimeFrom, String msgTimeTo, String isValidMsg, String processFlag) {
		super();
		this.msgTimeFrom = msgTimeFrom;
		this.msgTimeTo = msgTimeTo;
		this.isValidMsg = isValidMsg;
		this.processFlag = processFlag;
	}

	public String getMsgTimeFrom() {
		return msgTimeFrom;
	}

	public void setMsgTimeFrom(String msgTimeFrom) {
		this.msgTimeFrom = msgTimeFrom;
	}

	public String getMsgTimeTo() {
		return msgTimeTo;
	}

	public void setMsgTimeTo(String msgTimeTo) {
		this.msgTimeTo = msgTimeTo;
	}

	public String getIsValidMsg() {
		return isValidMsg;
	}

	public void setIsValidMsg(String isValidMsg) {
		this.isValidMsg = isValidMsg;
	}

	public String getProcessFlag() {
		return processFlag;
	}

	public void setProcessFlag(String processFlag) {
		this.processFlag = processFlag;
	}

}
