package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;

public interface DayOffTypeRepositoryCustom {
	
	public List<DayOffType> search(DayOffTypeSearchRequest dayOffTypeSearchRequest);
}
