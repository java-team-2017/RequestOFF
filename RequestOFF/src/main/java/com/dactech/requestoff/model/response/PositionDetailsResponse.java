package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Position;

public class PositionDetailsResponse extends Common {
	private Position position;

	public PositionDetailsResponse() {
	}

	public PositionDetailsResponse(Position position) {
		this.position = position;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

}
