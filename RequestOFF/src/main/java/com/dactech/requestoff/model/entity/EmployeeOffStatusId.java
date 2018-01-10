package com.dactech.requestoff.model.entity;

import java.io.Serializable;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class EmployeeOffStatusId implements Serializable {
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
