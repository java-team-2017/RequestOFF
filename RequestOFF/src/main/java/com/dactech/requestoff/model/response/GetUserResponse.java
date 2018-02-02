package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.entity.Employee;

public class GetUserResponse extends Common {
	Employee user;

	public GetUserResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GetUserResponse(StatusInfo statusInfo) {
		super(statusInfo);
		// TODO Auto-generated constructor stub
	}

	public GetUserResponse(Employee user) {
		super();
		this.user = user;
	}

	public Employee getUser() {
		return user;
	}

	public void setUser(Employee user) {
		this.user = user;
	}

}
