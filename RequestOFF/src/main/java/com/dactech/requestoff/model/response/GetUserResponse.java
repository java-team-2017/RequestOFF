package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.entity.Employee;

public class GetUserResponse extends Common {
	private Employee user;
	private List<IdName> listForward;
	private List<IdName> listRecipients;
	private double remainHours;
	private int leaderFlag;

	public Employee getUser() {
		return user;
	}

	public void setUser(Employee user) {
		this.user = user;
	}

	public List<IdName> getListForward() {
		return listForward;
	}

	public void setListForward(List<IdName> listForward) {
		this.listForward = listForward;
	}

	public List<IdName> getListRecipients() {
		return listRecipients;
	}

	public void setListRecipients(List<IdName> listRecipients) {
		this.listRecipients = listRecipients;
	}

	public double getRemainHours() {
		return remainHours;
	}

	public void setRemainHours(double remainHours) {
		this.remainHours = remainHours;
	}

	public int getLeaderFlag() {
		return leaderFlag;
	}

	public void setLeaderFlag(int leaderFlag) {
		this.leaderFlag = leaderFlag;
	}

	public GetUserResponse(Employee user, List<IdName> listForward, List<IdName> listRecipients, double remainHours,
			int leaderFlag) {
		super();
		this.user = user;
		this.listForward = listForward;
		this.listRecipients = listRecipients;
		this.remainHours = remainHours;
		this.leaderFlag = leaderFlag;
	}

	public GetUserResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GetUserResponse(StatusInfo statusInfo) {
		super(statusInfo);
		// TODO Auto-generated constructor stub
	}

	public static class IdName {
		private long id;
		private String name;

		public IdName() {
			super();
			// TODO Auto-generated constructor stub
		}

		public IdName(long id, String name) {
			this.id = id;
			this.name = name;
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

	}

}
