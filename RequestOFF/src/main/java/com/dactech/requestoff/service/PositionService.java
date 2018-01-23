package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.PositionDetailsRequest;
import com.dactech.requestoff.model.request.PositionRegistRequest;
import com.dactech.requestoff.model.request.PositionSearchRequest;
import com.dactech.requestoff.model.response.PositionDetailsResponse;
import com.dactech.requestoff.model.response.PositionRegistResponse;
import com.dactech.requestoff.model.response.PositionSearchResponse;

public interface PositionService {
	public PositionRegistResponse registPosition(PositionRegistRequest positionRegistRequest) throws Exception;

	public PositionSearchResponse searchPosition(PositionSearchRequest positionSearchRequest);

	public PositionDetailsResponse detailsPosition(PositionDetailsRequest positionDetailsRequest);
}
