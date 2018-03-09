package com.dactech.requestoff.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Position {
	public static final long CODE_EMPLOYEE = 1;
	public static final long CODE_LEADER = 2;
	public static final long CODE_MANAGER = 3;
	public static final long CODE_HR = 4;
	public static final long CODE_HR_MANAGER = 5;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String name;
	private int code;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	public Position() {
	}

	public Position(long id, String name, int code, int validFlag, String insertDate, long insertOperator,
			String updateDate, long updateOperator) {
		super();
		this.id = id;
		this.name = name;
		this.code = code;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
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

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
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

	public static long getCodeEmployee() {
		return CODE_EMPLOYEE;
	}

	public static long getCodeLeader() {
		return CODE_LEADER;
	}

	public static long getCodeManager() {
		return CODE_MANAGER;
	}

	public static long getCodeHr() {
		return CODE_HR;
	}

	public static long getCodeHrManager() {
		return CODE_HR_MANAGER;
	}

}
