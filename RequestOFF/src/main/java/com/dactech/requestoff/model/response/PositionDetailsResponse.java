package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.entity.Position;

public class PositionDetailsResponse {
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
