package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;
import com.dactech.requestoff.model.request.CompanyYearOffRegistRequest;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.model.response.CompanyYearOffDetailsResponse;
import com.dactech.requestoff.model.response.CompanyYearOffRegistResponse;
import com.dactech.requestoff.model.response.CompanyYearOffSearchResponse;

public interface CompanyYearOffService {
	public CompanyYearOffRegistResponse regist(CompanyYearOffRegistRequest companyYearOffRegistRequest);
	
	public CompanyYearOffSearchResponse search(CompanyYearOffSearchRequest companyYearOffSearchRequest);
	
	public CompanyYearOffDetailsResponse details(CompanyYearOffDetailsRequest companyYearOffDetailsRequest);
}
