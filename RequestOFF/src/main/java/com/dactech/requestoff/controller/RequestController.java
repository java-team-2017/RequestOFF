package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.request.RequestRegistRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.RequestRegistResponse;
import com.dactech.requestoff.model.response.RequestSearchResponse;
import com.dactech.requestoff.service.RequestService;

@RestController
public class RequestController {
	@Autowired
	RequestService requestService;
	
	@RequestMapping(value = "/request/regist", method = RequestMethod.POST)
	public RequestRegistResponse regist(@RequestBody RequestRegistRequest requestRegistRequest) {
		return requestService.regist(requestRegistRequest);
	}

	@RequestMapping(value = "request_search", method = RequestMethod.POST)
	public RequestSearchResponse requestSearch(@RequestBody RequestSearchRequest requestSearchRequest) {
		return requestService.requestSearch(requestSearchRequest);
	}
}
