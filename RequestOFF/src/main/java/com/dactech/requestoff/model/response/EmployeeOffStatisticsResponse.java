package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Request;

public class EmployeeOffStatisticsResponse extends Common {
	List<EmployeeStatistics> listEmployeeStatistics;

	public List<EmployeeStatistics> getListEmployeeStatistics() {
		return listEmployeeStatistics;
	}

	public void setListEmployeeStatistics(List<EmployeeStatistics> listEmployeeStatistics) {
		this.listEmployeeStatistics = listEmployeeStatistics;
	}

	public EmployeeOffStatisticsResponse(List<EmployeeStatistics> listEmployeeStatistics) {
		super();
		this.listEmployeeStatistics = listEmployeeStatistics;
	}

	public EmployeeOffStatisticsResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmployeeOffStatisticsResponse(StatusInfo statusInfo) {
		super(statusInfo);
		// TODO Auto-generated constructor stub
	}

	public static class EmployeeStatistics {
		private Employee employee;
		private List<Request> listRequestWithPaying;
		private List<Request> listRequestWithoutPaying;
		private long timeOffWithPaying;
		private long timeOffWithoutPaying;

		public EmployeeStatistics() {
			super();
		}

		public EmployeeStatistics(Employee employee, List<Request> listRequestWithPaying,
				List<Request> listRequestWithoutPaying, long timeOffWithPaying, long timeOffWithoutPaying) {
			super();
			this.employee = employee;
			this.listRequestWithPaying = listRequestWithPaying;
			this.listRequestWithoutPaying = listRequestWithoutPaying;
			this.timeOffWithPaying = timeOffWithPaying;
			this.timeOffWithoutPaying = timeOffWithoutPaying;
		}

		public Employee getEmployee() {
			return employee;
		}

		public void setEmployee(Employee employee) {
			this.employee = employee;
		}

		public List<Request> getListRequestWithPaying() {
			return listRequestWithPaying;
		}

		public void setListRequestWithPaying(List<Request> listRequestWithPaying) {
			this.listRequestWithPaying = listRequestWithPaying;
		}

		public List<Request> getListRequestWithoutPaying() {
			return listRequestWithoutPaying;
		}

		public void setListRequestWithoutPaying(List<Request> listRequestWithoutPaying) {
			this.listRequestWithoutPaying = listRequestWithoutPaying;
		}

		public long getTimeOffWithPaying() {
			return timeOffWithPaying;
		}

		public void setTimeOffWithPaying(long timeOffWithPaying) {
			this.timeOffWithPaying = timeOffWithPaying;
		}

		public long getTimeOffWithoutPaying() {
			return timeOffWithoutPaying;
		}

		public void setTimeOffWithoutPaying(long timeOffWithoutPaying) {
			this.timeOffWithoutPaying = timeOffWithoutPaying;
		}

	}
}
