package com.dactech.requestoff.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class Department {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String name;
	private long managerId;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	@Transient
	private Employee manager;
	
	public Department() {
		super();
	}

	public Department(long id, String name, long managerId, int validFlag, String insertDate, long insertOperator,
			String updateDate, long updateOperator, Employee manager) {
		super();
		this.id = id;
		this.name = name;
		this.managerId = managerId;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
		this.manager = manager;
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

	public Employee getManager() {
		return manager;
	}

	public void setManager(Employee manager) {
		this.manager = manager;
	}

}
