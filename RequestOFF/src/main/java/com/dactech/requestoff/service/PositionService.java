package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.PositionRegistRequest;
import com.dactech.requestoff.model.response.PositionRegistResponse;

public interface PositionService {
	public PositionRegistResponse registPosition(PositionRegistRequest positionRegistRequest);
}
