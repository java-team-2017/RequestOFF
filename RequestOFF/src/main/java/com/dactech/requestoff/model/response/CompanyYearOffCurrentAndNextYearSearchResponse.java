package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.CompanyYearOff;

public class CompanyYearOffCurrentAndNextYearSearchResponse extends Common {
	private List<CompanyYearOff> listCompanyYearOff;

	public CompanyYearOffCurrentAndNextYearSearchResponse(List<CompanyYearOff> listCompanyYearOff) {
		this.listCompanyYearOff = listCompanyYearOff;
	}

	public CompanyYearOffCurrentAndNextYearSearchResponse() {
	}

	public List<CompanyYearOff> getListCompanyYearOff() {
		return listCompanyYearOff;
	}

	public void setListCompanyYearOff(List<CompanyYearOff> listCompanyYearOff) {
		this.listCompanyYearOff = listCompanyYearOff;
	}

}
