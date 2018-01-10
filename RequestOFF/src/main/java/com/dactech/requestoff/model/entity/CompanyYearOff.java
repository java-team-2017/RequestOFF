package com.dactech.requestoff.model.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class CompanyYearOff {
	@Id
	private long id;
	private int dayOffResetFlag;
	private int currentYearFlag;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;
	@OneToMany(mappedBy = "companyYearOff", fetch = FetchType.LAZY)
	private List<EmployeeOffStatus> listEmployeeOffStatus;

	public CompanyYearOff() {
		super();
	}

	public CompanyYearOff(long id, int dayOffResetFlag, int currentYearFlag, int validFlag, String insertDate,
			long insertOperator, String updateDate, long updateOperator,
			List<EmployeeOffStatus> listEmployeeOffStatus) {
		super();
		this.id = id;
		this.dayOffResetFlag = dayOffResetFlag;
		this.currentYearFlag = currentYearFlag;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
		this.listEmployeeOffStatus = listEmployeeOffStatus;
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

	public List<EmployeeOffStatus> getListEmployeeOffStatus() {
		return listEmployeeOffStatus;
	}

	public void setListEmployeeOffStatus(List<EmployeeOffStatus> listEmployeeOffStatus) {
		this.listEmployeeOffStatus = listEmployeeOffStatus;
	}

}
