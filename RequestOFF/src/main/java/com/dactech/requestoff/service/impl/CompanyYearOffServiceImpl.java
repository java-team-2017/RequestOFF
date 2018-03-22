package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.CompanyYearOffCurrentAndNextYearSearchRequest;
import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;
import com.dactech.requestoff.model.request.CompanyYearOffRegistRequest;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.model.response.CompanyYearOffCurrentAndNextYearSearchResponse;
import com.dactech.requestoff.model.response.CompanyYearOffDetailsResponse;
import com.dactech.requestoff.model.response.CompanyYearOffRegistResponse;
import com.dactech.requestoff.model.response.CompanyYearOffSearchResponse;
import com.dactech.requestoff.repository.CompanyYearOffRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.service.CompanyYearOffService;
import com.dactech.requestoff.service.EmployeeOffStatusService;
import com.dactech.requestoff.util.StringUtil;

@Service
public class CompanyYearOffServiceImpl implements CompanyYearOffService{
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;
	@Autowired
	EmployeeOffStatusRepository employeeOffStatusRepository;
	@Autowired
	EmployeeOffStatusService employeeOffStatusService;
	
	@Override
	public CompanyYearOffRegistResponse regist(CompanyYearOffRegistRequest companyYearOffRegistRequest) throws Exception{
		CompanyYearOff companyYearOff;
		
		long currentYear, nextYear;
		currentYear = getCurrentYear();
		nextYear = currentYear + 1;
			
		companyYearOff = new CompanyYearOff();
		companyYearOff.setId(nextYear);
		companyYearOff.setDayOffResetFlag(Integer.parseInt(companyYearOffRegistRequest.getDayOffResetFlag()));
		companyYearOff.setNumberDayOff(Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()));
		companyYearOff.setCurrentYearFlag(CompanyYearOff.NEXT_YEAR);
		companyYearOff.setValidFlag(1);
		
		companyYearOffRepository.save(companyYearOff);
		
		CompanyYearOffRegistResponse companyYearOffRegistResponse = new CompanyYearOffRegistResponse();
		companyYearOffRegistResponse.setId(companyYearOff.getId());
		return companyYearOffRegistResponse;
	}
	
	@Override
	public CompanyYearOffSearchResponse search(CompanyYearOffSearchRequest companyYearOffSearchRequest) {
		List<CompanyYearOff> listCompanyYearOff = companyYearOffRepository.search(companyYearOffSearchRequest);
		CompanyYearOffSearchResponse companyYearOffSearchResponse = new CompanyYearOffSearchResponse(listCompanyYearOff);
		return companyYearOffSearchResponse;
	}
	
	@Override
	public CompanyYearOffDetailsResponse details(CompanyYearOffDetailsRequest companyYearOffDetailsRequest) {
		CompanyYearOff companyYearOff = companyYearOffRepository.findById(Long.parseLong(companyYearOffDetailsRequest.getId()));
		CompanyYearOffDetailsResponse companyYearOffDetailsResponse = new CompanyYearOffDetailsResponse(companyYearOff);
		return companyYearOffDetailsResponse;
	}
	
	@Override
	public long getCurrentYear() {
		CompanyYearOffSearchRequest cyoSearchRequest = new CompanyYearOffSearchRequest();
		cyoSearchRequest.setCurrentYearFlag("1");
		CompanyYearOffSearchResponse cyoSearchResponse = search(cyoSearchRequest);
		return cyoSearchResponse.getListCompanyYearOff().get(0).getId();
	}

	@Override
	public CompanyYearOffCurrentAndNextYearSearchResponse search(
			CompanyYearOffCurrentAndNextYearSearchRequest companyYearOffCurrentAndNextYearSearchRequest) {
		List<CompanyYearOff> listCompanyYearOff = companyYearOffRepository.getCompanyYearOffOfCurrentYearAndNextYear(companyYearOffCurrentAndNextYearSearchRequest);
		CompanyYearOffCurrentAndNextYearSearchResponse response = new CompanyYearOffCurrentAndNextYearSearchResponse(listCompanyYearOff);
		return response;

	}
}
