package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.RequestDetailsRequest;
import com.dactech.requestoff.model.request.RequestRegistRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.RequestDetailsResponse;
import com.dactech.requestoff.model.response.RequestRegistResponse;
import com.dactech.requestoff.model.response.RequestSearchResponse;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.model.response.TeamSearchResponse;
import com.dactech.requestoff.service.RequestService;

@RestController
public class RequestController {
	@Autowired
	RequestService requestService;

	@RequestMapping(value = "/request/regist", method = RequestMethod.POST)
	public RequestRegistResponse regist(@RequestBody RequestRegistRequest requestRegistRequest) {
		return requestService.regist(requestRegistRequest);
	}

	@RequestMapping(value = "/request/search", method = RequestMethod.POST)
	public RequestSearchResponse requestSearch(@RequestBody RequestSearchRequest requestSearchRequest) {
		RequestSearchResponse response = new RequestSearchResponse();
		try {
			response = requestService.requestSearch(requestSearchRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response = new RequestSearchResponse();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}

		return response;
	}

	@RequestMapping(value = "/request/details", method = RequestMethod.POST)
	public RequestDetailsResponse details(@RequestBody RequestDetailsRequest requestDetailsRequest) {
		return requestService.details(requestDetailsRequest);
	}
}
