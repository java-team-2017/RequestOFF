package com.dactech.requestoff.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
@IdClass(EmployeeRole.EmployeeRoleId.class)
public class EmployeeRole {
	@Id
	@Column(name = "employee_id")
	private long employeeId;
	@Id
	@Column(name = "role_id")
	private long roleId;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}

	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
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

	public EmployeeRole(long employeeId, long roleId, int validFlag, String insertDate, long insertOperator,
			String updateDate, long updateOperator) {
		super();
		this.employeeId = employeeId;
		this.roleId = roleId;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
	}

	public EmployeeRole() {
		super();
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("serial")
	public static class EmployeeRoleId implements Serializable {
		private long employeeId;
		private long roleId;

		public EmployeeRoleId() {
			super();
			// TODO Auto-generated constructor stub
		}

		public EmployeeRoleId(long employeeId, long roleId) {
			super();
			this.employeeId = employeeId;
			this.roleId = roleId;
		}

		public long getEmployeeId() {
			return employeeId;
		}

		public void setEmployeeId(long employeeId) {
			this.employeeId = employeeId;
		}

		public long getRoleId() {
			return roleId;
		}

		public void setRoleId(long roleId) {
			this.roleId = roleId;
		}

	}
}
