package com.dactech.requestoff.model.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Team {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	@OneToOne
	@JoinColumn(name = "leader_id")
	private Employee leader;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "department_id")
	private Department department;
	private int validFlag;
	private String insertDate;
	private long insertOperator;
	private String updateDate;
	private long updateOperator;

	@ManyToMany
	@JoinTable(name = "team_employee", joinColumns = @JoinColumn(name = "team_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "employee_id", referencedColumnName = "id"))
	private List<Employee> listEmployee;

	public Team() {
		super();
	}

	public Team(int id, String name, Employee leader, Department department, int validFlag, String insertDate,
			long insertOperator, String updateDate, long updateOperator, List<Employee> listEmployee) {
		super();
		this.id = id;
		this.name = name;
		this.leader = leader;
		this.department = department;
		this.validFlag = validFlag;
		this.insertDate = insertDate;
		this.insertOperator = insertOperator;
		this.updateDate = updateDate;
		this.updateOperator = updateOperator;
		this.listEmployee = listEmployee;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Employee getLeader() {
		return leader;
	}

	public void setLeader(Employee leader) {
		this.leader = leader;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
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

	public List<Employee> getListEmployee() {
		return listEmployee;
	}

	public void setListEmployee(List<Employee> listEmployee) {
		this.listEmployee = listEmployee;
	}

}
