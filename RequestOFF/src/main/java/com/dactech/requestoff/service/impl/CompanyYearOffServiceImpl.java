package com.dactech.requestoff.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.request.CompanyYearOffRegistRequest;
import com.dactech.requestoff.model.response.CompanyYearOffRegistResponse;
import com.dactech.requestoff.repository.CompanyYearOffRepository;
import com.dactech.requestoff.service.CompanyYearOffService;

@Service
public class CompanyYearOffServiceImpl implements CompanyYearOffService{
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;
	
	@Override
	public CompanyYearOffRegistResponse regist(CompanyYearOffRegistRequest companyYearOffRegistRequest) {
		CompanyYearOff companyYearOff = companyYearOffRepository.findById(companyYearOffRegistRequest.getId());
		
		if(companyYearOff == null) {
			companyYearOff = new CompanyYearOff();
			companyYearOff.setId(companyYearOffRegistRequest.getId());
		}
		
		companyYearOff.setDayOffResetFlag(companyYearOffRegistRequest.getDayOffResetFlag());
		companyYearOff.setCurrentYearFlag(companyYearOffRegistRequest.getCurrentYearFlag());
		companyYearOff.setValidFlag(companyYearOffRegistRequest.getValidFlag());
		
		companyYearOffRepository.save(companyYearOff);
		
		CompanyYearOffRegistResponse companyYearOffRegistResponse = new CompanyYearOffRegistResponse(companyYearOff.getId());
		return companyYearOffRegistResponse;
	}
}
