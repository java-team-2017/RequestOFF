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
import com.dactech.requestoff.util.StringUtil;

@Service
public class CompanyYearOffServiceImpl implements CompanyYearOffService{
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;
	
	@Override
	public CompanyYearOffRegistResponse regist(CompanyYearOffRegistRequest companyYearOffRegistRequest) throws Exception{
		CompanyYearOff companyYearOff;
		
		if(StringUtil.isEmpty(companyYearOffRegistRequest.getId())) {
			throw new Exception("Can not regist company year off without id");
		}
		else {
			long id = Long.parseLong(companyYearOffRegistRequest.getId());
			companyYearOff = companyYearOffRepository.findById(id);
			if(companyYearOff == null) { //create new company year off
				companyYearOff = new CompanyYearOff();
				companyYearOff.setId(Long.parseLong(companyYearOffRegistRequest.getId()));
				companyYearOff.setDayOffResetFlag(Integer.parseInt(companyYearOffRegistRequest.getDayOffResetFlag()));
				companyYearOff.setCurrentYearFlag(Integer.parseInt(companyYearOffRegistRequest.getCurrentYearFlag()));
				companyYearOff.setValidFlag(Integer.parseInt(companyYearOffRegistRequest.getValidFlag()));
			}
			else if(companyYearOffRegistRequest.getUpdateDate().equals( companyYearOff.getUpdateDate() ) == false) {
				throw new Exception("Someone updated CompanyYearOff with id " + companyYearOffRegistRequest.getId() + " at " + companyYearOff.getUpdateDate());
			}
			else {	//update company year off
				if(StringUtil.isNotEmpty(companyYearOffRegistRequest.getId())) {
					companyYearOff.setId(Long.parseLong(companyYearOffRegistRequest.getId()));
				}
				if(StringUtil.isNotEmpty(companyYearOffRegistRequest.getCurrentYearFlag())) {
					companyYearOff.setCurrentYearFlag(Integer.parseInt(companyYearOffRegistRequest.getCurrentYearFlag()));
				}
				if(StringUtil.isNotEmpty(companyYearOffRegistRequest.getDayOffResetFlag())) {
					companyYearOff.setDayOffResetFlag(Integer.parseInt(companyYearOffRegistRequest.getDayOffResetFlag()));
				}
				if(StringUtil.isNotEmpty(companyYearOffRegistRequest.getValidFlag())) {
					companyYearOff.setValidFlag(Integer.parseInt(companyYearOffRegistRequest.getValidFlag()));
				}
			}
		}
		
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
		CompanyYearOff companyYearOff = companyYearOffRepository.findById(companyYearOffDetailsRequest.getId());
		CompanyYearOffDetailsResponse companyYearOffDetailsResponse = new CompanyYearOffDetailsResponse(companyYearOff);
		return companyYearOffDetailsResponse;
	}
}
