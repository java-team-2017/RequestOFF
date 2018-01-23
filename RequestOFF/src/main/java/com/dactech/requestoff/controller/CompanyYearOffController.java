package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;
import com.dactech.requestoff.model.request.CompanyYearOffRegistRequest;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.model.response.CompanyYearOffDetailsResponse;
import com.dactech.requestoff.model.response.CompanyYearOffRegistResponse;
import com.dactech.requestoff.model.response.CompanyYearOffSearchResponse;
import com.dactech.requestoff.service.CompanyYearOffService;

@RestController
public class CompanyYearOffController {
	@Autowired
	CompanyYearOffService companyYearOffService;
	
	@RequestMapping(value = "/companyYearOff/regist", method = RequestMethod.POST)
	public CompanyYearOffRegistResponse regist(@RequestBody CompanyYearOffRegistRequest companyYearOffRegistRequest) {
		CompanyYearOffRegistResponse companyYearOffRegistResponse = new CompanyYearOffRegistResponse();
		StatusInfo statusInfo = null;
		try {
			companyYearOffRegistResponse = companyYearOffService.regist(companyYearOffRegistRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		companyYearOffRegistResponse.setStatusInfo(statusInfo);
		return companyYearOffRegistResponse;
	}
	
	@RequestMapping(value = "/companyYearOff/search", method = RequestMethod.POST)
	public CompanyYearOffSearchResponse search(@RequestBody CompanyYearOffSearchRequest companyYearOffSearchRequest) {
		CompanyYearOffSearchResponse companyYearOffSearchResponse = new CompanyYearOffSearchResponse();
		StatusInfo statusInfo = null;
		try {
			companyYearOffSearchResponse = companyYearOffService.search(companyYearOffSearchRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		companyYearOffSearchResponse.setStatusInfo(statusInfo);
		
		return companyYearOffSearchResponse;
	}
	
	@RequestMapping(value = "/companyYearOff/details", method = RequestMethod.POST)
	public CompanyYearOffDetailsResponse details(@RequestBody CompanyYearOffDetailsRequest companyYearOffDetailsRequest) {
		CompanyYearOffDetailsResponse companyYearOffDetailsResponse = new CompanyYearOffDetailsResponse();
		StatusInfo statusInfo = null;
		try {
			companyYearOffDetailsResponse = companyYearOffService.details(companyYearOffDetailsRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		companyYearOffDetailsResponse.setStatusInfo(statusInfo);
		
		return companyYearOffDetailsResponse;
	}
}
