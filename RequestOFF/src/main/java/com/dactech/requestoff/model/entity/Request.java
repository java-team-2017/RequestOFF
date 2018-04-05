package com.dactech.requestoff.model.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import com.dactech.requestoff.model.response.GetUserResponse.IdName;

@Entity
public class Request {
	public static final int REQUEST_STATUS_SAVED = 1;
	public static final int REQUEST_STATUS_APPROVED = 2;
	public static final int REQUEST_STATUS_DENIED = 3;
	public static final int REQUEST_STATUS_RESPONDED = 4;
	public static final int REQUEST_STATUS_WAITING = 5;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "employee_id")
	private Employee employee;
	private String fromTime;
	private String toTime;
	private double totalTime;
	private String reason;
	private int status;
	private String responseMessage;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "day_off_type_id")
	private DayOffType dayOffType;
	private long recipientId;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;
	@Transient
	private List<IdName> listForward;

	@Transient
	private String recipientName;

	public Request() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Request(long id, Employee employee, String fromTime, String toTime, double totalTime, String reason,
			int status, String responseMessage, DayOffType dayOffType, long recipientId, int validFlag,
			String insertDate, long insertOperator, String updateDate, long updateOperator, List<IdName> listForward,
			String recipientName) {
		this.id = id;
		this.employee = employee;
		this.fromTime = fromTime;
		this.toTime = toTime;
		this.totalTime = totalTime;
		this.reason = reason;
		this.status = status;
		this.responseMessage = responseMessage;
		this.dayOffType = dayOffType;
		this.recipientId = recipientId;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
		this.listForward = listForward;
		this.recipientName = recipientName;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
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

	public double getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(double totalTime) {
		this.totalTime = totalTime;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	public DayOffType getDayOffType() {
		return dayOffType;
	}

	public void setDayOffType(DayOffType dayOffType) {
		this.dayOffType = dayOffType;
	}

	public long getRecipientId() {
		return recipientId;
	}

	public void setRecipientId(long recipientId) {
		this.recipientId = recipientId;
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

	public List<IdName> getListForward() {
		return listForward;
	}

	public void setListForward(List<IdName> listForward) {
		this.listForward = listForward;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public static int getRequestStatusSaved() {
		return REQUEST_STATUS_SAVED;
	}

	public static int getRequestStatusApproved() {
		return REQUEST_STATUS_APPROVED;
	}

	public static int getRequestStatusDenied() {
		return REQUEST_STATUS_DENIED;
	}

	public static int getRequestStatusResponded() {
		return REQUEST_STATUS_RESPONDED;
	}

	public static int getRequestStatusWaiting() {
		return REQUEST_STATUS_WAITING;
	}

}
