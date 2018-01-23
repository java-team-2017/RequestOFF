package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.DayOffType;

public class DayOffTypeSearchResponse extends Common {
	private List<DayOffType> listDayOffType;

	public DayOffTypeSearchResponse() {
		super();
	}

	public DayOffTypeSearchResponse(List<DayOffType> listDayOffType) {
		super();
		this.listDayOffType = listDayOffType;
	}

	public List<DayOffType> getListDayOffType() {
		return listDayOffType;
	}

	public void setListDayOffType(List<DayOffType> listDayOffType) {
		this.listDayOffType = listDayOffType;
	}

}
