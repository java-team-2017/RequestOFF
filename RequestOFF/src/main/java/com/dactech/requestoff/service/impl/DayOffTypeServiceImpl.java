package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.request.DayOffTypeDetailsRequest;
import com.dactech.requestoff.model.request.DayOffTypeRegistRequest;
import com.dactech.requestoff.model.request.DayOffTypeSearchRequest;
import com.dactech.requestoff.model.response.DayOffTypeDetailsResponse;
import com.dactech.requestoff.model.response.DayOffTypeRegistResponse;
import com.dactech.requestoff.model.response.DayOffTypeSearchResponse;
import com.dactech.requestoff.repository.DayOffTypeRepository;
import com.dactech.requestoff.service.DayOffTypeService;

@Service
public class DayOffTypeServiceImpl implements DayOffTypeService {

	@Autowired
	DayOffTypeRepository dayOffTypeRepository;

	@Override
	public DayOffTypeRegistResponse registDayOffType(DayOffTypeRegistRequest dayOffTypeRegistRequest) throws Exception {
		DayOffType dayOffType;
		dayOffType = dayOffTypeRepository.findById(dayOffTypeRegistRequest.getId());

		if (dayOffType == null) {
			dayOffType = new DayOffType();
			dayOffType.setId(dayOffTypeRegistRequest.getId());
		} else if (!dayOffType.getUpdateDate().equals(dayOffTypeRegistRequest.getUpdateDate())) {
			throw new Exception("Someone updated day_off_type with id " + dayOffTypeRegistRequest.getId() + " at "
					+ dayOffType.getUpdateDate());

		}

		dayOffType.setName(dayOffTypeRegistRequest.getNameDayOffType());
		dayOffType.setPaymentFlag(dayOffTypeRegistRequest.getPaymentFlag());
		dayOffType.setValidFlag(dayOffTypeRegistRequest.getValidFlag());

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

	@Override
	public DayOffTypeDetailsResponse detailsDayOffType(DayOffTypeDetailsRequest dayOffTypeDetailsRequest) {
		DayOffType dayOffType = dayOffTypeRepository.findById(dayOffTypeDetailsRequest.getId());
		DayOffTypeDetailsResponse response = new DayOffTypeDetailsResponse(dayOffType);
		return response;
	}

}
