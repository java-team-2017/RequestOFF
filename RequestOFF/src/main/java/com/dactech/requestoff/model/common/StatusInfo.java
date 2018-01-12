package com.dactech.requestoff.model.common;

public class StatusInfo {
	
	public static final int SUCCESS = 0; 
	public static final int ERROR = 1;
	

	private int status;
	private String error;

	public StatusInfo() {
	}

	public StatusInfo(int status, String error) {
		super();
		this.status = status;
		this.error = error;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

}
