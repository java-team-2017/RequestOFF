package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.DayOffType;

public class DayOffTypeDetailsResponse extends Common {
	private DayOffType dayOffType;

	public DayOffTypeDetailsResponse() {
		super();
	}

	public DayOffTypeDetailsResponse(DayOffType dayOffType) {
		super();
		this.dayOffType = dayOffType;
	}

	public DayOffType getDayOffType() {
		return dayOffType;
	}

	public void setDayOffType(DayOffType dayOffType) {
		this.dayOffType = dayOffType;
	}

}
