package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.request.DayOffTypeRegistRequest;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;
import com.dactech.requestoff.model.response.DayOffTypeRegistResponse;
import com.dactech.requestoff.model.response.DayOffTypeSearchResponse;
import com.dactech.requestoff.repository.DayOffTypeRepository;
import com.dactech.requestoff.service.DayOffTypeService;

@Service
public class DayOffTypeServiceImpl implements DayOffTypeService {

	@Autowired
	DayOffTypeRepository dayOffTypeRepository;

	@Override
	public DayOffTypeRegistResponse saveDayOffType(DayOffTypeRegistRequest dayOffTypeRegistRequest) {
		DayOffType dayOffType;

		if (dayOffTypeRegistRequest.getId() != 0) {
			dayOffType = dayOffTypeRepository.findById(dayOffTypeRegistRequest.getId());
			dayOffType.setName(dayOffTypeRegistRequest.getNameDayOffType());
			dayOffType.setPaymentFlag(dayOffTypeRegistRequest.getPaymentFlag());
		} else {
			dayOffType = new DayOffType();
			dayOffType.setName(dayOffTypeRegistRequest.getNameDayOffType());
			dayOffType.setPaymentFlag(dayOffTypeRegistRequest.getPaymentFlag());
		}

		dayOffTypeRepository.save(dayOffType);
		return new DayOffTypeRegistResponse(dayOffType.getId());
	}

	@Override
	public DayOffTypeSearchResponse searchDayOffType(DayOffTypeSearchRequest dayOffTypeSearchRequest) {
		List<DayOffType> listDayOffType = dayOffTypeRepository.search(dayOffTypeSearchRequest);
		DayOffTypeSearchResponse response = new DayOffTypeSearchResponse();
		response.setListDayOffType(listDayOffType);
		return response;
	}

}
