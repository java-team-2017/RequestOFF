package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PositionRegistRequest {
	private long id;
	private String name;
	@JsonProperty("valid_flag")
	private int validFlag;
	@JsonProperty("update_date")
	private String updateDate;

	public PositionRegistRequest() {
	}

	public PositionRegistRequest(long id, String name, int validFlag, String updateDate) {
		this.id = id;
		this.name = name;
		this.validFlag = validFlag;
		this.updateDate = updateDate;
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

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
