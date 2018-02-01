package com.dactech.requestoff.model.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Employee {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String name;
	private String gender;
	private String birthday;
	@ManyToOne
	@JoinColumn(name = "position_id")
	@JsonIgnoreProperties("listEmployee")
	private Position position;
	private String email;
	@JsonIgnore
	private String password;
	private long phone;
	private String startWorkingDate;
	private String officialWorkingDate;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	@OneToMany(mappedBy = "employee")
	@JsonIgnoreProperties(value = { "employee", "recipient" })
	private List<Request> listRequest;

	@OneToMany(mappedBy = "recipient")
	@JsonIgnoreProperties(value = { "employee", "recipient" })
	private List<Request> listReceivedRequest;

	@OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
	@JsonIgnoreProperties("employee")
	private List<EmployeeOffStatus> listEmployeeOffStatus;

	@OneToOne(mappedBy = "manager")
	@JsonIgnoreProperties("manager")
	private Department department;

	@OneToOne(mappedBy = "leader")
	@JsonIgnoreProperties(value = { "leader", "listEmployee" })
	private Team team;

	@ManyToMany(mappedBy = "listEmployee")
	@JsonIgnoreProperties(value = { "listEmployee" })
	private List<Team> listTeam;

	@ManyToMany(mappedBy = "listEmployee")
	@JsonIgnoreProperties(value = { "listEmployee" })
	private List<Role> listRole;

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
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

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
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

	public int getValidFlag() {
		return validFlag;
	}

	public void setValidFlag(int validFlag) {
		this.validFlag = validFlag;
	}

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

	public long getInsertOperator() {
		return insertOperator;
	}

	public void setInsertOperator(long insertOperator) {
		this.insertOperator = insertOperator;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public long getUpdateOperator() {
		return updateOperator;
	}

	public void setUpdateOperator(long updateOperator) {
		this.updateOperator = updateOperator;
	}

	public List<Request> getListRequest() {
		return listRequest;
	}

	public void setListRequest(List<Request> listRequest) {
		this.listRequest = listRequest;
	}

	public List<Request> getListReceivedRequest() {
		return listReceivedRequest;
	}

	public void setListReceivedRequest(List<Request> listReceivedRequest) {
		this.listReceivedRequest = listReceivedRequest;
	}

	public List<EmployeeOffStatus> getListEmployeeOffStatus() {
		return listEmployeeOffStatus;
	}

	public void setListEmployeeOffStatus(List<EmployeeOffStatus> listEmployeeOffStatus) {
		this.listEmployeeOffStatus = listEmployeeOffStatus;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public List<Team> getListTeam() {
		return listTeam;
	}

	public void setListTeam(List<Team> listTeam) {
		this.listTeam = listTeam;
	}

	public List<Role> getListRole() {
		return listRole;
	}

	public void setListRole(List<Role> listRole) {
		this.listRole = listRole;
	}

	public Employee(long id, String name, String gender, String birthday, Position position, String email,
			String password, long phone, String startWorkingDate, String officialWorkingDate, int validFlag,
			String insertDate, long insertOperator, String updateDate, long updateOperator, List<Request> listRequest,
			List<Request> listReceivedRequest, List<EmployeeOffStatus> listEmployeeOffStatus, Department department,
			Team team, List<Team> listTeam, List<Role> listRole) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.position = position;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.startWorkingDate = startWorkingDate;
		this.officialWorkingDate = officialWorkingDate;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
		this.listRequest = listRequest;
		this.listReceivedRequest = listReceivedRequest;
		this.listEmployeeOffStatus = listEmployeeOffStatus;
		this.department = department;
		this.team = team;
		this.listTeam = listTeam;
		this.listRole = listRole;
	}

	

}
