package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.request.PositionDetailsRequest;
import com.dactech.requestoff.model.request.PositionRegistRequest;
import com.dactech.requestoff.model.request.PositionSearchRequest;
import com.dactech.requestoff.model.response.PositionDetailsResponse;
import com.dactech.requestoff.model.response.PositionRegistResponse;
import com.dactech.requestoff.model.response.PositionSearchResponse;
import com.dactech.requestoff.repository.PositionRepository;
import com.dactech.requestoff.service.PositionService;
import com.dactech.requestoff.util.StringUtil;

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	PositionRepository positionRepository;

	@Override
	public PositionRegistResponse registPosition(PositionRegistRequest request) throws Exception {
		Position position;
		if (StringUtil.isEmpty(request.getId())) { // create new PositionRegistResponse
			position = new Position();
			
			position.setCode(Integer.parseInt(request.getCode()));
			position.setName(request.getName());
			position.setValidFlag(Integer.parseInt(request.getValidFlag()));
			
		} else {
			long positionId = Long.parseLong(request.getId());
			position = positionRepository.findById(positionId);
			if (position == null) {
				throw new Exception("Không tìm thấy vị trí với id " + positionId);
			}
			
			if (!position.getUpdateDate().equals(request.getUpdateDate())) {
				throw new Exception("Vị trí với id " + position.getId() + " đã được chỉnh sửa vào lúc "
						+ position.getUpdateDate() + ".<br/>Vui lòng tải lại trang để cập nhật thông tin mới nhất");
			}
			
			if (StringUtil.isNotEmpty(request.getCode())) {
				position.setCode(Integer.parseInt(request.getCode()));
			}

			if (StringUtil.isNotEmpty(request.getName())) {
				position.setName(request.getName());
			}
			
			if (StringUtil.isNotEmpty(request.getValidFlag())) {
				position.setValidFlag(Integer.parseInt(request.getValidFlag()));
			}

		}

		positionRepository.save(position);
		return new PositionRegistResponse(position.getId());

	}

	@Override
	public PositionSearchResponse searchPosition(PositionSearchRequest positionSearchRequest) {
		List<Position> listPosition = positionRepository.search(positionSearchRequest);
		PositionSearchResponse response = new PositionSearchResponse();
		response.setListPosition(listPosition);
		return response;
	}

	@Override
	public PositionDetailsResponse detailsPosition(PositionDetailsRequest positionDetailsRequest) {
		Position position = positionRepository.findById(Long.parseLong(positionDetailsRequest.getId()));
		PositionDetailsResponse response = new PositionDetailsResponse(position);
		return response;
	}

}
