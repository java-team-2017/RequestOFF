package com.dactech.requestoff.model.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@IdClass(EmployeeOffStatus.EmployeeOffStatusId.class)
public class EmployeeOffStatus {
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "year_id")
	private CompanyYearOff companyYearOff;
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "employee_id")
	@JsonIgnoreProperties("listEmployeeOffStatus")
	private Employee employee;
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

	public EmployeeOffStatus(CompanyYearOff companyYearOff, Employee employee, long remainHours, long totalHours,
			int validFlag, String insertDate, long insertOperator, String updateDate, long updateOperator) {
		super();
		this.companyYearOff = companyYearOff;
		this.employee = employee;
		this.remainHours = remainHours;
		this.totalHours = totalHours;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
	}

	public CompanyYearOff getCompanyYearOff() {
		return companyYearOff;
	}

	public void setCompanyYearOff(CompanyYearOff companyYearOff) {
		this.companyYearOff = companyYearOff;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
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
	
	public static class EmployeeOffStatusId implements Serializable {
		private CompanyYearOff companyYearOff;
		private Employee employee;

		public CompanyYearOff getCompanyYearOff() {
			return companyYearOff;
		}

		public void setCompanyYearOff(CompanyYearOff companyYearOff) {
			this.companyYearOff = companyYearOff;
		}

		public Employee getEmployee() {
			return employee;
		}

		public void setEmployee(Employee employee) {
			this.employee = employee;
		}
	}
}
