package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
		return companyYearOffService.regist(companyYearOffRegistRequest);
	}
	
	@RequestMapping(value = "/companyYearOff/search", method = RequestMethod.POST)
	public CompanyYearOffSearchResponse search(@RequestBody CompanyYearOffSearchRequest companyYearOffSearchRequest) {
		return companyYearOffService.search(companyYearOffSearchRequest);
	}
	
	@RequestMapping(value = "/companyYearOff/details", method = RequestMethod.POST)
	public CompanyYearOffDetailsResponse details(@RequestBody CompanyYearOffDetailsRequest companyYearOffDetailsRequest) {
		return companyYearOffService.details(companyYearOffDetailsRequest);
	}
}
