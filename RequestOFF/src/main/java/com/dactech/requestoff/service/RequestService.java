package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.RequestDetailRequest;
import com.dactech.requestoff.model.request.RequestRegistRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.RequestDetailResponse;
import com.dactech.requestoff.model.response.RequestRegistResponse;
import com.dactech.requestoff.model.response.RequestSearchResponse;

public interface RequestService {
	public RequestRegistResponse regist(RequestRegistRequest requestRegistRequest);
	
	RequestSearchResponse requestSearch(RequestSearchRequest requestSearchRequest);
	
	public RequestDetailResponse detail(RequestDetailRequest requestDetailRequest);
}
