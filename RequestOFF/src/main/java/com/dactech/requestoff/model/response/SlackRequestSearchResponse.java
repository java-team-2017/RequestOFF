package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.entity.SlackRequest;

public class SlackRequestSearchResponse extends Common {
	List<SlackRequest> slackRequests;

	public List<SlackRequest> getSlackRequests() {
		return slackRequests;
	}

	public void setSlackRequests(List<SlackRequest> slackRequests) {
		this.slackRequests = slackRequests;
	}

	public SlackRequestSearchResponse(List<SlackRequest> slackRequests) {
		super();
		this.slackRequests = slackRequests;
	}

	public SlackRequestSearchResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SlackRequestSearchResponse(StatusInfo statusInfo) {
		super(statusInfo);
		// TODO Auto-generated constructor stub
	}
}
