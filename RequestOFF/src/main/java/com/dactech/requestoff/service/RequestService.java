package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.RequestBrowsingRequest;
import com.dactech.requestoff.model.request.RequestDetailsRequest;
import com.dactech.requestoff.model.request.RequestRegistRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.RequestBrowsingResponse;
import com.dactech.requestoff.model.response.RequestDetailsResponse;
import com.dactech.requestoff.model.response.RequestRegistResponse;
import com.dactech.requestoff.model.response.RequestSearchResponse;

public interface RequestService {
	public RequestRegistResponse regist(RequestRegistRequest requestRegistRequest) throws Exception;
	
	RequestSearchResponse requestSearch(RequestSearchRequest requestSearchRequest);
	
	public RequestDetailsResponse details(RequestDetailsRequest requestDetailsRequest);
	
	public RequestBrowsingResponse requestBrowsing(RequestBrowsingRequest request);
}
