package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.DayOffTypeRegistRequest;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;
import com.dactech.requestoff.model.response.DayOffTypeRegistResponse;
import com.dactech.requestoff.model.response.DayOffTypeSearchResponse;

public interface DayOffTypeService {
	
	public DayOffTypeRegistResponse saveDayOffType(DayOffTypeRegistRequest dayOffTypeRegistRequest);
	
	public DayOffTypeSearchResponse searchDayOffType(DayOffTypeSearchRequest dayOffTypeSearchRequest);
}
