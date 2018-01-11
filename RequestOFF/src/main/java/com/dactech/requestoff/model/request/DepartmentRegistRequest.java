package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class DepartmentRegistRequest {
	private long id;
	private String name;
	@JsonProperty("manager_id")
	private long managerId;

	public DepartmentRegistRequest(long id, String name, long managerId) {
		super();
		this.id = id;
		this.name = name;
		this.managerId = managerId;
	}

	public DepartmentRegistRequest() {
		super();
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

	public long getManagerId() {
		return managerId;
	}

	public void setManagerId(long managerId) {
		this.managerId = managerId;
	}

}
