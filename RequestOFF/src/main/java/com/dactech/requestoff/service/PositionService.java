package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.PositionRegistRequest;
import com.dactech.requestoff.model.request.PositionSearchRequest;
import com.dactech.requestoff.model.response.PositionRegistResponse;
import com.dactech.requestoff.model.response.PositionSearchResponse;

public interface PositionService {
	public PositionRegistResponse registPosition(PositionRegistRequest positionRegistRequest);

	public PositionSearchResponse searchPosition(PositionSearchRequest positionSearchRequest);
}
