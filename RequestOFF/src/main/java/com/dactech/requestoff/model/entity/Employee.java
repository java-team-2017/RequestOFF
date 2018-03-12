package com.dactech.requestoff.model.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	private Position position;
	private String email;
	@JsonIgnore
	private String password;
	private String phone;
	private String startWorkingDate;
	private String officialWorkingDate;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	@ManyToMany
	@JoinTable(name = "team_employee", joinColumns = @JoinColumn(name = "employee_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "team_id", referencedColumnName = "id"))
	private List<Team> listTeam;

	@ManyToMany
	@JoinTable(name = "employee_role", joinColumns = @JoinColumn(name = "employee_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"))
	private List<Role> listRole;

	@Transient
	private String departmentName; // employee is a manager
	@Transient
	private String teamName; // employee is a leader
	@Transient
	private EmployeeOffStatus employeeOffStatus;

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Employee(long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Employee(long id, String name, String gender, String birthday, Position position, String email,
			String password, String phone, String startWorkingDate, String officialWorkingDate, int validFlag,
			String insertDate, long insertOperator, String updateDate, long updateOperator, List<Team> listTeam,
			List<Role> listRole, String departmentName, String teamName, EmployeeOffStatus employeeOffStatus) {
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
		this.listTeam = listTeam;
		this.listRole = listRole;
		this.departmentName = departmentName;
		this.teamName = teamName;
		this.employeeOffStatus = employeeOffStatus;
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

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public EmployeeOffStatus getEmployeeOffStatus() {
		return employeeOffStatus;
	}

	public void setEmployeeOffStatus(EmployeeOffStatus employeeOffStatus) {
		this.employeeOffStatus = employeeOffStatus;
	}

}
