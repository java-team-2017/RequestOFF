package com.dactech.requestoff.model.common;

import com.fasterxml.jackson.annotation.JsonProperty;

public abstract class Common {
	@JsonProperty("status_info")
	private StatusInfo statusInfo;

	public Common() {
	}

	public Common(StatusInfo statusInfo) {
		super();
		this.statusInfo = statusInfo;
	}

	public StatusInfo getStatusInfo() {
		return statusInfo;
	}

	public void setStatusInfo(StatusInfo statusInfo) {
		this.statusInfo = statusInfo;
	}

}
