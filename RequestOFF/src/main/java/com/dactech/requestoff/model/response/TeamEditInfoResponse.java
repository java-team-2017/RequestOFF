package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;

public class TeamEditInfoResponse extends Common {
	private List<Employee> listMember;
	private List<Employee> listMemberNotInTeam;
	private List<Department> listDepartment;
	private long currentLeaderId;

	public TeamEditInfoResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TeamEditInfoResponse(StatusInfo statusInfo) {
		super(statusInfo);
		// TODO Auto-generated constructor stub
	}

	public TeamEditInfoResponse(List<Employee> listMember, List<Employee> listMemberNotInTeam,
			List<Department> listDepartment, long currentLeaderId) {
		super();
		this.listMember = listMember;
		this.listMemberNotInTeam = listMemberNotInTeam;
		this.listDepartment = listDepartment;
		this.currentLeaderId = currentLeaderId;
	}

	public List<Employee> getListMember() {
		return listMember;
	}

	public void setListMember(List<Employee> listMember) {
		this.listMember = listMember;
	}

	public List<Employee> getListMemberNotInTeam() {
		return listMemberNotInTeam;
	}

	public void setListMemberNotInTeam(List<Employee> listMemberNotInTeam) {
		this.listMemberNotInTeam = listMemberNotInTeam;
	}

	public List<Department> getListDepartment() {
		return listDepartment;
	}

	public void setListDepartment(List<Department> listDepartment) {
		this.listDepartment = listDepartment;
	}

	public long getCurrentLeaderId() {
		return currentLeaderId;
	}

	public void setCurrentLeaderId(long currentLeaderId) {
		this.currentLeaderId = currentLeaderId;
	}

}
