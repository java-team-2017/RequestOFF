package com.dactech.requestoff.service;

import java.util.Date;
import java.util.List;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.entity.SlackRequest;
import com.dactech.requestoff.model.request.SlackRequestRegistRequest;
import com.dactech.requestoff.model.request.SlackRequestSearchRequest;
import com.dactech.requestoff.model.response.SlackRequestRegistResponse;
import com.dactech.requestoff.model.response.SlackRequestSearchResponse;

public interface SlackRequestService {
	long slackRequestRegist(SlackRequest slackRequest);
	
	SlackRequestRegistResponse regist(SlackRequestRegistRequest request) throws Exception;
	
	List<SlackRequest> getSlackRequest(String token, String channel, Date latest, Date oldest) throws Exception;
	
	Request convertSlackRequest(SlackRequest slackRequest) throws Exception;
	
	SlackRequestSearchResponse search(SlackRequestSearchRequest request);
	
	long importSlackRequest(String token, String channel, Date latest, Date oldest) throws Exception;
	
	void save(SlackRequest slackRequests);
	
	void sendRequestMsgToSlack(Request request) throws Exception;
}
