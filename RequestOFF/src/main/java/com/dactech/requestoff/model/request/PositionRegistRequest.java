package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PositionRegistRequest {
	private String id;
	private String code;
	private String name;
	@JsonProperty("valid_flag")
	private String validFlag;
	@JsonProperty("update_date")
	private String updateDate;

	public PositionRegistRequest() {
	}

	public PositionRegistRequest(String id, String code, String name, String validFlag, String updateDate) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.validFlag = validFlag;
		this.updateDate = updateDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

}
