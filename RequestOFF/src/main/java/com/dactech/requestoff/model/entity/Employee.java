package com.dactech.requestoff.model.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
public class Employee {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@ManyToMany
	@JoinTable(name = "team_employee", joinColumns = @JoinColumn(name = "employee_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "team_id", referencedColumnName = "id"))
	private long id;
	private String name;
	private String gender;
	private String birthday;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "position_id")
	@JsonProperty("position")
	private Position position;
	private String email;
	private long phone;
	private String start_working_date;
	private String official_working_date;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;
	@OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
	private List<Employee> listEmployee;
	
	@OneToMany(mappedBy = "employee", fetch = FetchType.LAZY)
	private List<EmployeeOffStatus> listEmployeeOffStatus;
	
	public Employee(long id, String name, String gender, String birthday, Position position, String email, long phone,
			String start_working_date, String official_working_date, int validFlag, String insertDate,
			long insertOperator, String updateDate, long updateOperator) {
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.position = position;
		this.email = email;
		this.phone = phone;
		this.start_working_date = start_working_date;
		this.official_working_date = official_working_date;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
	}

	public Employee() {
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

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getStart_working_date() {
		return start_working_date;
	}

	public void setStart_working_date(String start_working_date) {
		this.start_working_date = start_working_date;
	}

	public String getOfficial_working_date() {
		return official_working_date;
	}

	public void setOfficial_working_date(String official_working_date) {
		this.official_working_date = official_working_date;
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
}
