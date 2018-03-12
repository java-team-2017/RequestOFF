package com.dactech.requestoff.model.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Team {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String name;
	private long leaderId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "department_id")
	@JsonIgnoreProperties("listTeam")
	private Department department;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;
	@Transient
	private Employee leader;

	public Team() {
		super();
	}

	public Team(long id, String name, long leaderId, Department department, int validFlag, String insertDate,
			long insertOperator, String updateDate, long updateOperator, Employee leader) {
		super();
		this.id = id;
		this.name = name;
		this.leaderId = leaderId;
		this.department = department;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
		this.leader = leader;
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

	public long getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(long leaderId) {
		this.leaderId = leaderId;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
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

	public Employee getLeader() {
		return leader;
	}

	public void setLeader(Employee leader) {
		this.leader = leader;
	}

}
