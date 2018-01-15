package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeRegistRequest {
	private long id;
	private String name;
	private String gender;
	private String birthday;
	@JsonProperty("position_id")
	private long positionId;
	private String email;
	private long phone;
	@JsonProperty("start_working_date")
	private String startWorkingDate;
	@JsonProperty("official_working_date")
	private String officialWorkingDate;

	public EmployeeRegistRequest() {
	}

	public EmployeeRegistRequest(long id, String name, String gender, String birthday, long positionId, String email,
			long phone, String startWorkingDate, String officialWorkingDate) {
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.positionId = positionId;
		this.email = email;
		this.phone = phone;
		this.startWorkingDate = startWorkingDate;
		this.officialWorkingDate = officialWorkingDate;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public long getPositionId() {
		return positionId;
	}

	public void setPositionId(long positionId) {
		this.positionId = positionId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getStartWorkingDate() {
		return startWorkingDate;
	}

	public void setStartWorkingDate(String startWorkingDate) {
		this.startWorkingDate = startWorkingDate;
	}

	public String getOfficialWorkingDate() {
		return officialWorkingDate;
	}

	public void setOfficialWorkingDate(String officialWorkingDate) {
		this.officialWorkingDate = officialWorkingDate;
	}

}
