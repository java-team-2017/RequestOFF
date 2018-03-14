package com.dactech.requestoff.model.request;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeRegistRequest {
	private String id;
	private String name;
	private String gender;
	private String birthday;
	@JsonProperty("position_id")
	private String positionId;
	private String email;
	private String password;
	private String phone;
	@JsonProperty("start_working_date")
	private String startWorkingDate;
	@JsonProperty("official_working_date")
	private String officialWorkingDate;
	@JsonProperty("update_date")
	private String updateDate;
	@JsonProperty("valid_flag")
	private String validFlag;

	// @JsonProperty("team_id")
	// private String teamId;
	@JsonProperty("role_ids")
	private List<String> roleIds;

	@JsonProperty("total_off_hours")
	private String totalOffHours;
	@JsonProperty("remain_hours")
	private String remainHours;

	public EmployeeRegistRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmployeeRegistRequest(String id, String name, String gender, String birthday, String positionId,
			String email, String password, String phone, String startWorkingDate, String officialWorkingDate,
			String updateDate, String validFlag, List<String> roleIds, String totalOffHours, String remainHours) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.positionId = positionId;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.startWorkingDate = startWorkingDate;
		this.officialWorkingDate = officialWorkingDate;
		this.updateDate = updateDate;
		this.validFlag = validFlag;
		this.roleIds = roleIds;
		this.totalOffHours = totalOffHours;
		this.remainHours = remainHours;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getOfficialWorkingDate() {
		return officialWorkingDate;
	}

	public void setOfficialWorkingDate(String officialWorkingDate) {
		this.officialWorkingDate = officialWorkingDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(String validFlag) {
		this.validFlag = validFlag;
	}

	public List<String> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<String> roleIds) {
		this.roleIds = roleIds;
	}

	public String getTotalOffHours() {
		return totalOffHours;
	}

	public void setTotalOffHours(String totalOffHours) {
		this.totalOffHours = totalOffHours;
	}

	public String getRemainHours() {
		return remainHours;
	}

	public void setRemainHours(String remainHours) {
		this.remainHours = remainHours;
	}

}
