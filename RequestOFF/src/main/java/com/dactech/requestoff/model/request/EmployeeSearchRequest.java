package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeSearchRequest {
	private long id;
	private String name;
	@JsonProperty("name_match_status")
	private int nameMatchStatus;
	private String gender;
	private String birthday;
	@JsonProperty("position_id")
	private long positionId;
	private String email;
	private long phone;
	@JsonProperty("start_working_date")
	private String startWorkingDate;
	@JsonProperty("offical_working_date")
	private String officalWorkingDate;
	@JsonProperty("valid_flag")
	private int validFlag;

	public EmployeeSearchRequest() {
		super();
	}
	

	public EmployeeSearchRequest(long id, String name, int nameMatchStatus, String gender, String birthday,
			long positionId, String email, long phone, String startWorkingDate, String officalWorkingDate,
			int validFlag) {
		super();
		this.id = id;
		this.name = name;
		this.nameMatchStatus = nameMatchStatus;
		this.gender = gender;
		this.birthday = birthday;
		this.positionId = positionId;
		this.email = email;
		this.phone = phone;
		this.startWorkingDate = startWorkingDate;
		this.officalWorkingDate = officalWorkingDate;
		this.validFlag = validFlag;
	}



	@Override
	public String toString() {
		return "EmployeeSearchRequest [id=" + id + ", name=" + name + ", nameMatchStatus=" + nameMatchStatus
				+ ", gender=" + gender + ", birthday=" + birthday + ", positionId=" + positionId + ", email=" + email
				+ ", phone=" + phone + ", startWorkingDate=" + startWorkingDate + ", officalWorkingDate="
				+ officalWorkingDate + ", validFlag=" + validFlag + "]";
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

	public String getOfficalWorkingDate() {
		return officalWorkingDate;
	}

	public void setOfficalWorkingDate(String officalWorkingDate) {
		this.officalWorkingDate = officalWorkingDate;
	}

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

}
