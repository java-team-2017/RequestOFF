package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;

public class CompanyYearOffRegistResponse extends Common {
	private long id;

	public CompanyYearOffRegistResponse() {
		super();
	}

	public CompanyYearOffRegistResponse(long id) {
		super();
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
