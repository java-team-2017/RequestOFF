package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.entity.Department;

public class DepartmentDetailsResponse {
	Department department;

	public DepartmentDetailsResponse() {
		super();
	}

	public DepartmentDetailsResponse(Department department) {
		super();
		this.department = department;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

}
