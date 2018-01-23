package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Department;

public class DepartmentDetailsResponse extends Common{
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
