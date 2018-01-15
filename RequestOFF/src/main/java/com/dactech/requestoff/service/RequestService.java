package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.RequestSearchResponse;

public interface RequestService {
	RequestSearchResponse requestSearch(RequestSearchRequest requestSearchRequest);
}
