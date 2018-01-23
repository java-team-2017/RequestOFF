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

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	PositionRepository positionRepository;

	@Override
	public PositionRegistResponse registPosition(PositionRegistRequest positionRegistRequest) throws Exception {
		Position position;
		position = positionRepository.findById(positionRegistRequest.getId());

		if (position == null) {
			position = new Position();
			position.setId(positionRegistRequest.getId());
		} else if (!position.getUpdateDate().equals(positionRegistRequest.getUpdateDate())) {
			throw new Exception("Someone updated position with id " + positionRegistRequest.getId() + " at "
					+ position.getUpdateDate());

		}
		position.setName(positionRegistRequest.getName());
		position.setValidFlag(positionRegistRequest.getValidFlag());

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
		Position position = positionRepository.findById(positionDetailsRequest.getId());
		PositionDetailsResponse response = new PositionDetailsResponse(position);
		return response;
	}

}
