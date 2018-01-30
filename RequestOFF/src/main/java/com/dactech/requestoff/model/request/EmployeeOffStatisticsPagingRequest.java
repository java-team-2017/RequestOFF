package com.dactech.requestoff.model.request;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dactech.requestoff.model.common.PagingColumn;
import com.dactech.requestoff.model.common.PagingOrder;
import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeOffStatisticsPagingRequest {
	private String draw;
	private int start;
	private int length;
	private String searchValue;
	private boolean searchRegex;
	List<PagingColumn> columns;
	List<PagingOrder> orders;

	private String fromTime;
	private String toTime;
	private long departmentId;
	private long teamId;
	private String employee;

	public EmployeeOffStatisticsPagingRequest() {
		super();
	}

	public EmployeeOffStatisticsPagingRequest(HttpServletRequest request) {
		this.setDraw(request.getParameter("draw"));
		this.setStart(Integer.parseInt(request.getParameter("start")));
		this.setLength(Integer.parseInt(request.getParameter("length")));
		this.setSearchValue(request.getParameter("search[value]"));
		this.setSearchRegex(Boolean.parseBoolean(request.getParameter("search[regex]")));

		int numOfCol = PagingColumn.getNumberOfColumns(request);
		List<PagingColumn> columns = new ArrayList<PagingColumn>(numOfCol);
		for (int i = 0; i < numOfCol; i++) {
			PagingColumn col = new PagingColumn(request, i);
			columns.add(col);
		}
		this.setColumns(columns);

		int numOfOrd = PagingOrder.getNumberOfOrder(request);
		List<PagingOrder> orders = new ArrayList<PagingOrder>(numOfOrd);
		for (int i = 0; i < numOfOrd; i++) {
			PagingOrder order = new PagingOrder(request, i);
			orders.add(order);
		}
		this.setOrders(orders);
		
		this.setFromTime(request.getParameter("from_time"));
		this.setToTime(request.getParameter("to_time"));
		if (request.getParameter("department_id") != null && !request.getParameter("department_id").equals("")) {
			this.setDepartmentId(Long.parseLong(request.getParameter("department_id")));
		} else {
			this.setDepartmentId(0);
		}
		if (request.getParameter("team_id") != null && !request.getParameter("team_id").equals("")) {
			this.setTeamId(Long.parseLong(request.getParameter("team_id")));
		} else {
			this.setTeamId(0);
		}
		
		this.setEmployee(request.getParameter("employee"));
	}

	public EmployeeOffStatisticsPagingRequest(String draw, int start, int length, String searchValue,
			boolean searchRegex, List<PagingColumn> columns, List<PagingOrder> orders) {
		super();
		this.draw = draw;
		this.start = start;
		this.length = length;
		this.searchValue = searchValue;
		this.searchRegex = searchRegex;
		this.columns = columns;
		this.orders = orders;
	}

	public String getDraw() {
		return draw;
	}

	public void setDraw(String draw) {
		this.draw = draw;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public boolean isSearchRegex() {
		return searchRegex;
	}

	public void setSearchRegex(boolean searchRegex) {
		this.searchRegex = searchRegex;
	}

	public List<PagingColumn> getColumns() {
		return columns;
	}

	public void setColumns(List<PagingColumn> columns) {
		this.columns = columns;
	}

	public List<PagingOrder> getOrders() {
		return orders;
	}

	public void setOrders(List<PagingOrder> orders) {
		this.orders = orders;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

	public long getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(long departmentId) {
		this.departmentId = departmentId;
	}

	public long getTeamId() {
		return teamId;
	}

	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}

	public String getEmployee() {
		return employee;
	}

	public void setEmployee(String employee) {
		this.employee = employee;
	}

}
