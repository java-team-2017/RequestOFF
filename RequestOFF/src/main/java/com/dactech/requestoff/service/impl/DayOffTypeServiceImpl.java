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
import com.dactech.requestoff.util.StringUtil;

@Service
public class DayOffTypeServiceImpl implements DayOffTypeService {

	@Autowired
	DayOffTypeRepository dayOffTypeRepository;

	@Override
	public DayOffTypeRegistResponse registDayOffType(DayOffTypeRegistRequest request) throws Exception {
		DayOffType dayOffType;
		if (StringUtil.isEmpty(request.getId())) { // create new DayOffTypeRegistRequest
			dayOffType = new DayOffType();

			dayOffType.setName(request.getNameDayOffType());
			dayOffType.setPaymentFlag(Integer.parseInt(request.getPaymentFlag()));
			dayOffType.setValidFlag(Integer.parseInt(request.getValidFlag()));
		} else { // update
			long dayOffTypeId = Long.parseLong(request.getId());
			dayOffType = dayOffTypeRepository.findById(dayOffTypeId);
			if (dayOffType == null) {
				throw new Exception("Không tìm thấy loại ngày nghỉ với id " + dayOffTypeId);
			}

			if (!dayOffType.getUpdateDate().equals(request.getUpdateDate())) {
				throw new Exception("Loại ngày nghỉ với id " + dayOffType.getId() + " đã được chỉnh sửa vào lúc "
						+ dayOffType.getUpdateDate() + ". Vui lòng tải lại trang để cập nhật thông tin mới nhất");
			}

			if (StringUtil.isNotEmpty(request.getNameDayOffType())) {
				dayOffType.setName(request.getNameDayOffType());
			}

			if (StringUtil.isNotEmpty(request.getPaymentFlag())) {
				dayOffType.setPaymentFlag(Integer.parseInt(request.getPaymentFlag()));
			}
			
			if (StringUtil.isNotEmpty(request.getValidFlag())) {
				dayOffType.setValidFlag(Integer.parseInt(request.getValidFlag()));
			}
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

	@Override
	public DayOffTypeDetailsResponse detailsDayOffType(DayOffTypeDetailsRequest dayOffTypeDetailsRequest) {
		DayOffType dayOffType = dayOffTypeRepository.findById(Long.parseLong(dayOffTypeDetailsRequest.getId()));
		DayOffTypeDetailsResponse response = new DayOffTypeDetailsResponse(dayOffType);
		return response;
	}

}
