package com.dactech.requestoff.model.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
@IdClass(EmployeeOffStatus.EmployeeOffStatusId.class)
public class EmployeeOffStatus {
	@Id
	private long yearId;
	@Id
	private long employeeId;
	private long remainHours;
	private long totalHours;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	public EmployeeOffStatus() {
		super();
	}

	public EmployeeOffStatus(long yearId, long employeeId, long remainHours, long totalHours, int validFlag,
			String insertDate, long insertOperator, String updateDate, long updateOperator) {
		super();
		this.yearId = yearId;
		this.employeeId = employeeId;
		this.remainHours = remainHours;
		this.totalHours = totalHours;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
	}

	public long getYearId() {
		return yearId;
	}

	public void setYearId(long yearId) {
		this.yearId = yearId;
	}

	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}

	public long getRemainHours() {
		return remainHours;
	}

	public void setRemainHours(long remainHours) {
		this.remainHours = remainHours;
	}

	public long getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(long totalHours) {
		this.totalHours = totalHours;
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

	@SuppressWarnings("serial")
	public static class EmployeeOffStatusId implements Serializable {
		private long yearId;
		private long employeeId;

		public EmployeeOffStatusId() {
			super();
			// TODO Auto-generated constructor stub
		}

		public EmployeeOffStatusId(long yearId, long employeeId) {
			super();
			this.yearId = yearId;
			this.employeeId = employeeId;
		}

		public long getYearId() {
			return yearId;
		}

		public void setYearId(long yearId) {
			this.yearId = yearId;
		}

		public long getEmployeeId() {
			return employeeId;
		}

		public void setEmployeeId(long employeeId) {
			this.employeeId = employeeId;
		}

	}
}
