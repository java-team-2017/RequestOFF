package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.CompanyYearOff;

public class CompanyYearOffSearchResponse extends Common{
	private List<CompanyYearOff> listCompanyYearOff;

	public CompanyYearOffSearchResponse() {
		super();
	}

	public CompanyYearOffSearchResponse(List<CompanyYearOff> listCompanyYearOff) {
		super();
		this.listCompanyYearOff = listCompanyYearOff;
	}

	public List<CompanyYearOff> getListCompanyYearOff() {
		return listCompanyYearOff;
	}

	public void setListCompanyYearOff(List<CompanyYearOff> listCompanyYearOff) {
		this.listCompanyYearOff = listCompanyYearOff;
	}

}
