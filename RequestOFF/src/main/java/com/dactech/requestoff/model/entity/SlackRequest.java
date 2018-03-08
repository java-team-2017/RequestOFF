package com.dactech.requestoff.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SlackRequest {
	public static final int VALID_REQUEST_MSG = 1;
	public static final int INVALID_REQUEST_MSG = 0;
	public static final int PROCESSED = 1;
	public static final int UNPROCESSED = 0;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String msgUserId;
	private String name;
	private String msgContent;
	private long msgTime; // time of slack message (milliseconds from 1970)
	private String dayOffFrom;
	private String dayOffTo;
	private double totalHours;
	private String reason;
	private int processFlag;
	private int isValidMsg;
	private String errMsg;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	public SlackRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SlackRequest(long id, String msgUserId, String name, String msgContent, long msgTime, String dayOffFrom,
			String dayOffTo, double totalHours, String reason, int processFlag, int isValidMsg, String errMsg,
			int validFlag, String insertDate, long insertOperator, String updateDate, long updateOperator) {
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
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
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

	public long getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(long msgTime) {
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

	public double getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(double totalHours) {
		this.totalHours = totalHours;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getProcessFlag() {
		return processFlag;
	}

	public void setProcessFlag(int processFlag) {
		this.processFlag = processFlag;
	}

	public int getIsValidMsg() {
		return isValidMsg;
	}

	public void setIsValidMsg(int isValidMsg) {
		this.isValidMsg = isValidMsg;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

	public long getInsertOperator() {
		return insertOperator;
	}

	public void setInsertOperator(long insertOperator) {
		this.insertOperator = insertOperator;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public long getUpdateOperator() {
		return updateOperator;
	}

	public void setUpdateOperator(long updateOperator) {
		this.updateOperator = updateOperator;
	}

}
