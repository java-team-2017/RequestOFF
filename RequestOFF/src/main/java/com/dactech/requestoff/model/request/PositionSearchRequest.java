package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

public class PositionSearchRequest {
	private long id;
	private String name;
	@JsonProperty("name_match_status")
	private int nameMatchStatus;
	@JsonIgnoreProperties("valid_flag")
	private int validFlag;

	public PositionSearchRequest() {
		super();
	}

	public PositionSearchRequest(long id, String name, int nameMatchStatus, int validFlag) {
		super();
		this.id = id;
		this.name = name;
		this.nameMatchStatus = nameMatchStatus;
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

	public int getNameMatchStatus() {
		return nameMatchStatus;
	}

	public void setNameMatchStatus(int nameMatchStatus) {
		this.nameMatchStatus = nameMatchStatus;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

}
