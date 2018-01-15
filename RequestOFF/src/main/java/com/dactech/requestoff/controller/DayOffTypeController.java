package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.request.DayOffTypeRegistRequest;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;
import com.dactech.requestoff.model.response.DayOffTypeRegistResponse;
import com.dactech.requestoff.model.response.DayOffTypeSearchResponse;
import com.dactech.requestoff.service.DayOffTypeService;

@RestController
public class DayOffTypeController {
	@Autowired
	DayOffTypeService dayOffTypeService;

	@RequestMapping(value = "/registDayOffType", method = RequestMethod.POST)
	public DayOffTypeRegistResponse insert(@RequestBody DayOffTypeRegistRequest dayOffTypeRegistRequest) {
		DayOffTypeRegistResponse dayOffTypeRegistResponse = dayOffTypeService.registDayOffType(dayOffTypeRegistRequest);
		return dayOffTypeRegistResponse;
	}

	@RequestMapping(value = "/searchDayOffType", method = RequestMethod.POST)
	public DayOffTypeSearchResponse search(@RequestBody DayOffTypeSearchRequest dayOffTypeSearchRequest) {
		DayOffTypeSearchResponse dayOffTypeSearchResponse = dayOffTypeService.searchDayOffType(dayOffTypeSearchRequest);
		return dayOffTypeSearchResponse;
	}

}
