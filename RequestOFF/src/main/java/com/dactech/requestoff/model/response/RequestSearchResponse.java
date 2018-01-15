package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.entity.Request;

public class RequestSearchResponse extends Common {
	List<Request> requests;

	public RequestSearchResponse() {
		super();
	}

	public RequestSearchResponse(StatusInfo statusInfo) {
		super(statusInfo);
	}

	public RequestSearchResponse(List<Request> requests) {
		super();
		this.requests = requests;
	}

	public List<Request> getRequests() {
		return requests;
	}

	public void setRequests(List<Request> requests) {
		this.requests = requests;
	}

}
