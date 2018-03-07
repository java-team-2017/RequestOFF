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
	private double remainHours;
	private double totalHours;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

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

	public double getRemainHours() {
		return remainHours;
	}

	public void setRemainHours(double remainHours) {
		this.remainHours = remainHours;
	}

	public double getTotalHours() {
		return totalHours;
	}

	public void setTotalHours(double totalHours) {
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

	public EmployeeOffStatus(long yearId, long employeeId, double remainHours, double totalHours, int validFlag,
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

	public EmployeeOffStatus() {
		super();
		// TODO Auto-generated constructor stub
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
