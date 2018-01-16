package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.request.PositionSearchRequest;

public interface PositionRepositoryCustom {
	public List<Position> search(PositionSearchRequest positionSearchRequest);

}
