package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.entity.Request;
import com.fasterxml.jackson.annotation.JsonProperty;

public class RequestDetailResponse {
	Request request;

	public RequestDetailResponse() {
		super();
	}

	public RequestDetailResponse(Request request) {
		super();
		this.request = request;
	}

	public Request getRequest() {
		return request;
	}

	public void setRequest(Request request) {
		this.request = request;
	}

}
