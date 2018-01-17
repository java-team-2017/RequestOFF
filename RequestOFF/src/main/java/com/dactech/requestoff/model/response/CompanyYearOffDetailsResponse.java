package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.entity.CompanyYearOff;

public class CompanyYearOffDetailsResponse {
	CompanyYearOff companyYearOff;

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
