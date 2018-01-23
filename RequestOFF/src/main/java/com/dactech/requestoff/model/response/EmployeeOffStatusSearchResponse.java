package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;

public class EmployeeOffStatusSearchResponse extends Common {
	private List<EmployeeOffStatus> listEmployeeOffStatus;

	public EmployeeOffStatusSearchResponse() {
	}

	public EmployeeOffStatusSearchResponse(List<EmployeeOffStatus> listEmployeeOffStatus) {
		this.listEmployeeOffStatus = listEmployeeOffStatus;
	}

	public List<EmployeeOffStatus> getListEmployeeOffStatus() {
		return listEmployeeOffStatus;
	}

	public void setListEmployeeOffStatus(List<EmployeeOffStatus> listEmployeeOffStatus) {
		this.listEmployeeOffStatus = listEmployeeOffStatus;
	}

}
