package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;
import com.dactech.requestoff.model.request.CompanyYearOffRegistRequest;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.model.response.CompanyYearOffDetailsResponse;
import com.dactech.requestoff.model.response.CompanyYearOffRegistResponse;
import com.dactech.requestoff.model.response.CompanyYearOffSearchResponse;
import com.dactech.requestoff.repository.CompanyYearOffRepository;
import com.dactech.requestoff.service.CompanyYearOffService;

@Service
public class CompanyYearOffServiceImpl implements CompanyYearOffService{
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;
	
	@Override
	public CompanyYearOffRegistResponse regist(CompanyYearOffRegistRequest companyYearOffRegistRequest) throws Exception{
		CompanyYearOffRegistResponse companyYearOffRegistResponse = new CompanyYearOffRegistResponse();
		CompanyYearOff companyYearOff = companyYearOffRepository.findById(companyYearOffRegistRequest.getId());
		
		if(companyYearOff == null) {
			companyYearOff = new CompanyYearOff();
			companyYearOff.setId(companyYearOffRegistRequest.getId());
		}
		else {
			if(companyYearOffRegistRequest.getUpdateDate().equals( companyYearOff.getUpdateDate() ) == false) {
				throw new Exception("Someone updated CompanyYearOff with id " + companyYearOffRegistRequest.getId() + " at " + companyYearOff.getUpdateDate());
			}
		}
		
		companyYearOff.setDayOffResetFlag(companyYearOffRegistRequest.getDayOffResetFlag());
		companyYearOff.setCurrentYearFlag(companyYearOffRegistRequest.getCurrentYearFlag());
		companyYearOff.setValidFlag(companyYearOffRegistRequest.getValidFlag());
		
		companyYearOffRepository.save(companyYearOff);
		
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
		CompanyYearOff companyYearOff = companyYearOffRepository.findById(companyYearOffDetailsRequest.getId());
		CompanyYearOffDetailsResponse companyYearOffDetailsResponse = new CompanyYearOffDetailsResponse(companyYearOff);
		return companyYearOffDetailsResponse;
	}
}
