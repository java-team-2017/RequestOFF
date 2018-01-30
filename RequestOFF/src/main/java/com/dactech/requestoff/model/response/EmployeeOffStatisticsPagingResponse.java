package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Request;

public class EmployeeOffStatisticsPagingResponse {
	private String draw;
	private int recordsTotal;
	private int recordsFiltered;
	List<EmployeeStatistics> listEmployeeStatistics;
	private String error;

	public EmployeeOffStatisticsPagingResponse() {
		super();
	}

	public String getDraw() {
		return draw;
	}

	public void setDraw(String draw) {
		this.draw = draw;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public List<EmployeeStatistics> getListEmployeeStatistics() {
		return listEmployeeStatistics;
	}

	public void setListEmployeeStatistics(List<EmployeeStatistics> listEmployeeStatistics) {
		this.listEmployeeStatistics = listEmployeeStatistics;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public EmployeeOffStatisticsPagingResponse(String draw, int recordsTotal, int recordsFiltered,
			List<EmployeeStatistics> listEmployeeStatistics, String error) {
		super();
		this.draw = draw;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.listEmployeeStatistics = listEmployeeStatistics;
		this.error = error;
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
