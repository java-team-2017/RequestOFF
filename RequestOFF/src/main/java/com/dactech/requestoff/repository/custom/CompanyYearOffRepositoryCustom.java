package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.model.response.CompanyYearOffSearchResponse;

public interface CompanyYearOffRepositoryCustom {
	public List<CompanyYearOff> search(CompanyYearOffSearchRequest companyYearOffSearchRequest);
	
}
