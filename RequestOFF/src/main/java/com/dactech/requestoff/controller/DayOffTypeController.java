package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.DayOffTypeDetailsRequest;
import com.dactech.requestoff.model.request.DayOffTypeRegistRequest;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;
import com.dactech.requestoff.model.response.DayOffTypeDetailsResponse;
import com.dactech.requestoff.model.response.DayOffTypeRegistResponse;
import com.dactech.requestoff.model.response.DayOffTypeSearchResponse;
import com.dactech.requestoff.service.DayOffTypeService;

@RestController
public class DayOffTypeController {
	@Autowired
	DayOffTypeService dayOffTypeService;

	@RequestMapping(value = "/dayOffType/regist", method = RequestMethod.POST)
	public DayOffTypeRegistResponse registDayOffType(@RequestBody DayOffTypeRegistRequest dayOffTypeRegistRequest) {
		DayOffTypeRegistResponse response = new DayOffTypeRegistResponse();
		StatusInfo statusInfo = null;
		try {
			response = dayOffTypeService.registDayOffType(dayOffTypeRegistRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}

	@RequestMapping(value = "/dayOffType/search", method = RequestMethod.POST)
	public DayOffTypeSearchResponse searchDayOffType(@RequestBody DayOffTypeSearchRequest dayOffTypeSearchRequest) {
		DayOffTypeSearchResponse response = new DayOffTypeSearchResponse();
		StatusInfo statusInfo = null;
		try {
			response = dayOffTypeService.searchDayOffType(dayOffTypeSearchRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}

	@RequestMapping(value = "/dayOffType/details", method = RequestMethod.POST)
	public DayOffTypeDetailsResponse detailsDayOffType(@RequestBody DayOffTypeDetailsRequest dayOffTypeDetailsRequest) {
		DayOffTypeDetailsResponse response = new DayOffTypeDetailsResponse();
		StatusInfo statusInfo = null;
		try {
			response = dayOffTypeService.detailsDayOffType(dayOffTypeDetailsRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}
}
