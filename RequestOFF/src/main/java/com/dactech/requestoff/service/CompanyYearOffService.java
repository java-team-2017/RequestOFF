package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;
import com.dactech.requestoff.model.request.CompanyYearOffRegistRequest;
import com.dactech.requestoff.model.response.CompanyYearOffDetailsResponse;
import com.dactech.requestoff.model.response.CompanyYearOffRegistResponse;

public interface CompanyYearOffService {
	public CompanyYearOffRegistResponse regist(CompanyYearOffRegistRequest companyYearOffRegistRequest);
	
	public CompanyYearOffDetailsResponse details(CompanyYearOffDetailsRequest companyYearOffDetailsRequest);
}
