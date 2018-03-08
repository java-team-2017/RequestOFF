package com.dactech.requestoff.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.SlackRequestRegistRequest;
import com.dactech.requestoff.model.request.SlackRequestSearchRequest;
import com.dactech.requestoff.model.response.SlackRequestRegistResponse;
import com.dactech.requestoff.model.response.SlackRequestSearchResponse;
import com.dactech.requestoff.service.SlackRequestService;

@RestController
public class SlackRequestController<ProcessSlackMsgResponse> {
	@Autowired
	SlackRequestService slackRequestService;

	@RequestMapping(value = "/slack/import", method = RequestMethod.GET)
	String importMsg() {
		try {
			String token = "xoxp-19649473766-19665717429-193929444448-26860ce71a6202e1e1aa0ad9f658691f";
			String channel = "C0KJXFU5S";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//			Date oldest = sdf.parse("2017/07/10 10:45:01");
//			Date latest = sdf.parse("2017/07/10 11:50:00");
			Date oldest = sdf.parse("2017/01/01 00:00:01");
			Date latest = sdf.parse("2017/12/01 00:00:00");
			slackRequestService.importSlackRequest(token, channel, latest, oldest);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	@RequestMapping(value = "/slack/search", method = RequestMethod.POST)
	public SlackRequestSearchResponse slackRequestSearch(@RequestBody SlackRequestSearchRequest request) {
		SlackRequestSearchResponse response = new SlackRequestSearchResponse();
		try {
			response = slackRequestService.search(request);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}

		return response;
	}

	@RequestMapping(value = "/slack/regist", method = RequestMethod.POST)
	public SlackRequestRegistResponse slackRegist(@RequestBody SlackRequestRegistRequest request) {
		SlackRequestRegistResponse response = new SlackRequestRegistResponse();
		try {
			response = slackRequestService.regist(request);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}

		return response;
	}

}
