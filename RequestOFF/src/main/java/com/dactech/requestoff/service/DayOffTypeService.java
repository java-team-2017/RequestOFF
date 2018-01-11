package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.DayOffTypeRegistRequest;
import com.dactech.requestoff.model.response.DayOffTypeRegistResponse;

public interface DayOffTypeService {
	
	public DayOffTypeRegistResponse saveDayOffType(DayOffTypeRegistRequest dayOffTypeRegistRequest);
}
