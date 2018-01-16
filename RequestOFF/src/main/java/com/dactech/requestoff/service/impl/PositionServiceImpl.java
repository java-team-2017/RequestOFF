package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.request.PositionRegistRequest;
import com.dactech.requestoff.model.request.PositionSearchRequest;
import com.dactech.requestoff.model.response.PositionRegistResponse;
import com.dactech.requestoff.model.response.PositionSearchResponse;
import com.dactech.requestoff.repository.PositionRepository;
import com.dactech.requestoff.service.PositionService;

@Service
public class PositionServiceImpl implements PositionService {

	@Autowired
	PositionRepository positionRepository;

	@Override
	public PositionRegistResponse registPosition(PositionRegistRequest positionRegistRequest) {
		Position position;

		if (positionRegistRequest.getId() != 0) {
			position = positionRepository.findByid(positionRegistRequest.getId());
			position.setName(positionRegistRequest.getName());
		} else {
			position = new Position();
			position.setName(positionRegistRequest.getName());
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

}
