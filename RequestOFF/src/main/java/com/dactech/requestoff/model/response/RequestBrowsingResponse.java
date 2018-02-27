package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Request;

public class RequestBrowsingResponse extends Common {
	private List<Request> requests;

	public List<Request> getRequests() {
		return requests;
	}

	public void setRequests(List<Request> requests) {
		this.requests = requests;
	}

	public RequestBrowsingResponse(List<Request> requests) {
		this.requests = requests;
	}

	public RequestBrowsingResponse() {
	}

}
