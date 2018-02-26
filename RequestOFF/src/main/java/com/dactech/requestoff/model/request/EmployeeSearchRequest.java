package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeSearchRequest {
	private String id;
	private String name;
	@JsonProperty("name_match_status")
	private String nameMatchStatus;
	private String gender;
	private String birthday;
	@JsonProperty("position_id")
	private String positionId;
	private String email;
	private String phone;
	@JsonProperty("start_working_date")
	private String startWorkingDate;
	@JsonProperty("offical_working_date")
	private String officalWorkingDate;
	@JsonProperty("valid_flag")
	private String validFlag;
	@JsonProperty("team_id")
	private String teamId;
	@JsonProperty("department_id")
	private String departmentId;

	public EmployeeSearchRequest() {
	}

	public EmployeeSearchRequest(String id, String name, String nameMatchStatus, String gender, String birthday,
			String positionId, String email, String phone, String startWorkingDate, String officalWorkingDate,
			String validFlag, String teamId, String departmentId) {
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
		this.teamId = teamId;
		this.departmentId = departmentId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPositionId() {
		return positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
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

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

}
