package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.DayOffTypeDetailsRequest;
import com.dactech.requestoff.model.request.DayOffTypeRegistRequest;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;
import com.dactech.requestoff.model.response.DayOffTypeDetailsResponse;
import com.dactech.requestoff.model.response.DayOffTypeRegistResponse;
import com.dactech.requestoff.model.response.DayOffTypeSearchResponse;

public interface DayOffTypeService {

	public DayOffTypeRegistResponse registDayOffType(DayOffTypeRegistRequest dayOffTypeRegistRequest) throws Exception;

	public DayOffTypeSearchResponse searchDayOffType(DayOffTypeSearchRequest dayOffTypeSearchRequest);

	public DayOffTypeDetailsResponse detailsDayOffType(DayOffTypeDetailsRequest dayOffTypeDetailsRequest);

}
