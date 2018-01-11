package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.entity.Department;

public class DepartmentSearchResponse {
	private List<Department> listDepartment;

	public DepartmentSearchResponse() {
		super();
	}

	public DepartmentSearchResponse(List<Department> listDepartment) {
		super();
		this.listDepartment = listDepartment;
	}

	public List<Department> getListDepartment() {
		return listDepartment;
	}

	public void setListDepartment(List<Department> listDepartment) {
		this.listDepartment = listDepartment;
	}

}
