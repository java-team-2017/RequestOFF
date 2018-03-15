package com.dactech.requestoff.model.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class CompanyYearOff {
	public static final int DAY_OFF_RESET = 1;
	public static final int DAY_OFF_NOT_RESET = 0;
	public static final int DEFAULT_DAY_OFF_RESET_FLAG = DAY_OFF_NOT_RESET;
	public static final int DEFAULT_NUMBER_DAY_OFF = 12;
	public static final int OLD_YEAR = 0;
	public static final int LAST_YEAR = 2;
	public static final int CURRENT_YEAR = 1;
	public static final int NEXT_YEAR = 3;
	
	@Id
	private long id;
	private int dayOffResetFlag;
	private int numberDayOff;
	private int currentYearFlag;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	public CompanyYearOff() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompanyYearOff(long id, int dayOffResetFlag, int numberDayOff, int currentYearFlag, int validFlag,
			String insertDate, long insertOperator, String updateDate, long updateOperator) {
		super();
		this.id = id;
		this.dayOffResetFlag = dayOffResetFlag;
		this.numberDayOff = numberDayOff;
		this.currentYearFlag = currentYearFlag;
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

	public int getDayOffResetFlag() {
		return dayOffResetFlag;
	}

	public void setDayOffResetFlag(int dayOffResetFlag) {
		this.dayOffResetFlag = dayOffResetFlag;
	}

	public int getNumberDayOff() {
		return numberDayOff;
	}

	public void setNumberDayOff(int numberDayOff) {
		this.numberDayOff = numberDayOff;
	}

	public int getCurrentYearFlag() {
		return currentYearFlag;
	}

	public void setCurrentYearFlag(int currentYearFlag) {
		this.currentYearFlag = currentYearFlag;
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