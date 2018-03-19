package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.RequestBrowsingRequest;
import com.dactech.requestoff.model.request.RequestDetailsRequest;
import com.dactech.requestoff.model.request.RequestRegistRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.request.RequestViewRequest;
import com.dactech.requestoff.model.response.RequestBrowsingResponse;
import com.dactech.requestoff.model.response.RequestDetailsResponse;
import com.dactech.requestoff.model.response.RequestRegistResponse;
import com.dactech.requestoff.model.response.RequestSearchResponse;
import com.dactech.requestoff.model.response.RequestViewResponse;
import com.dactech.requestoff.service.RequestService;

@RestController
public class RequestController {
	@Autowired
	RequestService requestService;

	@RequestMapping(value = "/request/regist", method = RequestMethod.POST)
	public RequestRegistResponse regist(@RequestBody RequestRegistRequest requestRegistRequest) {
		RequestRegistResponse requestRegistResponse = new RequestRegistResponse();
		StatusInfo statusInfo = null;
		try {
			requestRegistResponse = requestService.regist(requestRegistRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
			e.printStackTrace();
		}
		requestRegistResponse.setStatusInfo(statusInfo);
		return requestRegistResponse;
	}

	@RequestMapping(value = "/request/search", method = RequestMethod.POST)
	public RequestSearchResponse requestSearch(@RequestBody RequestSearchRequest requestSearchRequest) {
		RequestSearchResponse response = new RequestSearchResponse();
		try {
			response = requestService.requestSearch(requestSearchRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		
		return response;
	}

	@RequestMapping(value = "/request/details", method = RequestMethod.POST)
	public RequestDetailsResponse details(@RequestBody RequestDetailsRequest requestDetailsRequest) {
		RequestDetailsResponse requestDetailsResponse = new RequestDetailsResponse();
		try {
			requestDetailsResponse = requestService.details(requestDetailsRequest);
			requestDetailsResponse.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			requestDetailsResponse.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		
		return requestDetailsResponse;
	}
	
	@RequestMapping(value = "/request/getRequestBrowsing", method = RequestMethod.POST)
	public RequestBrowsingResponse getRequestBrowsing(@RequestBody RequestBrowsingRequest request) {
		RequestBrowsingResponse response = new RequestBrowsingResponse();
		try {
			response = requestService.requestBrowsing(request);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			System.err.println(e.getMessage());
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		
		return response;
	}
	
	@RequestMapping(value = "/request/viewRequest", method = RequestMethod.POST)
	public RequestViewResponse viewRequest(@RequestBody RequestViewRequest request) {
		RequestViewResponse response = new RequestViewResponse();
		try {
			response = requestService.viewRequest(request);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			System.err.println(e.getMessage());
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		
		return response;
	}
}
