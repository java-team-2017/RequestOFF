package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Position;

public class PositionSearchResponse extends Common {
	private List<Position> listPosition;

	public PositionSearchResponse() {
		super();
	}

	public PositionSearchResponse(List<Position> listPosition) {
		super();
		this.listPosition = listPosition;
	}

	public List<Position> getListPosition() {
		return listPosition;
	}

	public void setListPosition(List<Position> listPosition) {
		this.listPosition = listPosition;
	}

}
