package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.common.StatusInfo;

public class SlackRequestRegistResponse extends Common {
	private long id;

	public SlackRequestRegistResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SlackRequestRegistResponse(StatusInfo statusInfo) {
		super(statusInfo);
		// TODO Auto-generated constructor stub
	}

	public SlackRequestRegistResponse(long id) {
		super();
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
