package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Request;

public class RequestDetailsResponse extends Common {
	Request request;

	public RequestDetailsResponse() {
		super();
	}

	public RequestDetailsResponse(Request request) {
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
