package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PositionRegistRequest {
	private long id;
	private String name;
	@JsonProperty("valid_flag")
	private int validFlag;

	public PositionRegistRequest() {
		super();
	}

	public PositionRegistRequest(long id, String name, int validFlag) {
		super();
		this.id = id;
		this.name = name;
		this.validFlag = validFlag;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

}
