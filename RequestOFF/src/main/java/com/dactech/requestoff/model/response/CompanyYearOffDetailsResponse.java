package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.CompanyYearOff;

public class CompanyYearOffDetailsResponse extends Common{
	private CompanyYearOff companyYearOff;

	public CompanyYearOffDetailsResponse() {
		super();
	}

	public CompanyYearOffDetailsResponse(CompanyYearOff companyYearOff) {
		super();
		this.companyYearOff = companyYearOff;
	}

	public CompanyYearOff getCompanyYearOff() {
		return companyYearOff;
	}

	public void setCompanyYearOff(CompanyYearOff companyYearOff) {
		this.companyYearOff = companyYearOff;
	}

}
