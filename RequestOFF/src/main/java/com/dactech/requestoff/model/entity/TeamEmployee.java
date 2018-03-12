package com.dactech.requestoff.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity
@IdClass(TeamEmployee.TeamEmployeeId.class)
public class TeamEmployee {
	@Id
	@Column(name = "team_id")
	private long teamId;
	@Id
	@Column(name = "employee_id")
	private long employeeId;
	private int leaderFlag;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	public long getTeamId() {
		return teamId;
	}

	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}

	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}

	public int getLeaderFlag() {
		return leaderFlag;
	}

	public void setLeaderFlag(int leaderFlag) {
		this.leaderFlag = leaderFlag;
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

	public TeamEmployee(long teamId, long employeeId, int leaderFlag, int validFlag, String insertDate,
			long insertOperator, String updateDate, long updateOperator) {
		super();
		this.teamId = teamId;
		this.employeeId = employeeId;
		this.leaderFlag = leaderFlag;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
	}

	public TeamEmployee() {
		super();
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("serial")
	public static class TeamEmployeeId implements Serializable {
		private long teamId;
		private long employeeId;

		public TeamEmployeeId(long teamId, long employeeId) {
			super();
			this.teamId = teamId;
			this.employeeId = employeeId;
		}

		public TeamEmployeeId() {
			super();
			// TODO Auto-generated constructor stub
		}

		public long getTeamId() {
			return teamId;
		}

		public void setTeamId(long teamId) {
			this.teamId = teamId;
		}

		public long getEmployeeId() {
			return employeeId;
		}

		public void setEmployeeId(long employeeId) {
			this.employeeId = employeeId;
		}

	}
}
