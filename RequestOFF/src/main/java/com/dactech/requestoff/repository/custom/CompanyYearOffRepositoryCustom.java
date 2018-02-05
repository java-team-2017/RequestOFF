package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;

public interface CompanyYearOffRepositoryCustom {
	public List<CompanyYearOff> search(CompanyYearOffSearchRequest companyYearOffSearchRequest);
	
}
