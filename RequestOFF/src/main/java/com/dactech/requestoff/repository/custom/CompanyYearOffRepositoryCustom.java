package com.dactech.requestoff.repository.custom;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;

public interface CompanyYearOffRepositoryCustom {
	public CompanyYearOff details(CompanyYearOffDetailsRequest companyYearOffDetailsRequest);
}
