package com.dactech.requestoff.model.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class SlackExecuteImport {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long executeId;
	private Date timeStart;
	private Date timeEnd;

	public SlackExecuteImport(long executeId, Date timeStart, Date timeEnd) {
		this.executeId = executeId;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;
	}

	public SlackExecuteImport() {
	}

	public long getExecuteId() {
		return executeId;
	}

	public void setExecuteId(long executeId) {
		this.executeId = executeId;
	}

	public Date getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(Date timeStart) {
		this.timeStart = timeStart;
	}

	public Date getTimeEnd() {
		return timeEnd;
	}

	public void setTimeEnd(Date timeEnd) {
		this.timeEnd = timeEnd;
	}

}
