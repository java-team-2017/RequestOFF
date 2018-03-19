package com.dactech.requestoff.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DayOffType {
	public static final long PAYMENT_FLAG_PAYING = 1;
	public static final long PAYMENT_FLAG_NOT_PAYING = 0;
	
	public static final long NGHI_PHEP_THUONG_ID = 26;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String name;
	private int paymentFlag;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	public DayOffType() {
	}

	public DayOffType(long id, String name, int paymentFlag, int validFlag, String insertDate, long insertOperator,
			String updateDate, long updateOperator) {
		super();
		this.id = id;
		this.name = name;
		this.paymentFlag = paymentFlag;
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

	public int getPaymentFlag() {
		return paymentFlag;
	}

	public void setPaymentFlag(int paymentFlag) {
		this.paymentFlag = paymentFlag;
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
