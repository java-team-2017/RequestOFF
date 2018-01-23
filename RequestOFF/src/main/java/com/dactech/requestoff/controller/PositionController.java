package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.PositionDetailsRequest;
import com.dactech.requestoff.model.request.PositionRegistRequest;
import com.dactech.requestoff.model.request.PositionSearchRequest;
import com.dactech.requestoff.model.response.PositionDetailsResponse;
import com.dactech.requestoff.model.response.PositionRegistResponse;
import com.dactech.requestoff.model.response.PositionSearchResponse;
import com.dactech.requestoff.service.PositionService;

@RestController
public class PositionController {
	@Autowired
	PositionService positionService;

	@RequestMapping(value = "/position/regist", method = RequestMethod.POST)
	public PositionRegistResponse registPosition(@RequestBody PositionRegistRequest positionRegistRequest) {
		PositionRegistResponse response = new PositionRegistResponse();
		StatusInfo statusInfo = null;
		try {
			response = positionService.registPosition(positionRegistRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;

	}

	@RequestMapping(value = "/position/search", method = RequestMethod.POST)
	public PositionSearchResponse searchPosition(@RequestBody PositionSearchRequest positionSearchRequest) {
		PositionSearchResponse response = new PositionSearchResponse();
		StatusInfo statusInfo = null;
		try {
			response = positionService.searchPosition(positionSearchRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}

	@RequestMapping(value = "/position/details", method = RequestMethod.POST)
	public PositionDetailsResponse detailsPosition(@RequestBody PositionDetailsRequest positionDetailsRequest) {
		PositionDetailsResponse response = new PositionDetailsResponse();
		StatusInfo statusInfo = null;
		try {
			response = positionService.detailsPosition(positionDetailsRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}

}
