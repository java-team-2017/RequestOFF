package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Request;

public class RequestViewResponse extends Common{
	private List<Request> request;

	public RequestViewResponse(List<Request> request) {
		this.request = request;
	}

	public RequestViewResponse() {
	}

	public List<Request> getRequest() {
		return request;
	}

	public void setRequest(List<Request> request) {
		this.request = request;
	};

}
