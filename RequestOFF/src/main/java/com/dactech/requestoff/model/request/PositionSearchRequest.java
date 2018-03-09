package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

public class PositionSearchRequest {
	private String id;
	private String code;
	private String name;
	@JsonProperty("name_match_status")
	private String nameMatchStatus;
	@JsonIgnoreProperties("valid_flag")
	private String validFlag;

	public PositionSearchRequest() {
	}

	public PositionSearchRequest(String id, String code, String name, String nameMatchStatus, String validFlag) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.nameMatchStatus = nameMatchStatus;
		this.validFlag = validFlag;
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

	public String getNameMatchStatus() {
		return nameMatchStatus;
	}

	public void setNameMatchStatus(String nameMatchStatus) {
		this.nameMatchStatus = nameMatchStatus;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

}
