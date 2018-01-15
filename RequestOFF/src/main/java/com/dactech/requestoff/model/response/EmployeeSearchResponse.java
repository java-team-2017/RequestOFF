package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.entity.Employee;

public class EmployeeSearchResponse {
	private List<Employee> employees;

	public EmployeeSearchResponse() {
	}

	public EmployeeSearchResponse(List<Employee> employees) {
		super();
		this.employees = employees;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

}
