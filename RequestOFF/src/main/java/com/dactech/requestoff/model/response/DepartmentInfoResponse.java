package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Employee;

public class DepartmentInfoResponse extends Common {
	private List<Employee> listManagers;
	private List<Employee> listManagerNotInDepartment;

	public List<Employee> getListManagers() {
		return listManagers;
	}

	public void setListManagers(List<Employee> listManagers) {
		this.listManagers = listManagers;
	}

	public List<Employee> getListManagerNotInDepartment() {
		return listManagerNotInDepartment;
	}

	public void setListManagerNotInDepartment(List<Employee> listManagerNotInDepartment) {
		this.listManagerNotInDepartment = listManagerNotInDepartment;
	}

	public DepartmentInfoResponse(List<Employee> listManagers, List<Employee> listManagerNotInDepartment) {
		this.listManagers = listManagers;
		this.listManagerNotInDepartment = listManagerNotInDepartment;
	}

	public DepartmentInfoResponse() {
	}

}
