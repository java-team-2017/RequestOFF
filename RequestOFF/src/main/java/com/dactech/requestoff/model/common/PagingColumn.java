package com.dactech.requestoff.model.common;

import java.util.Enumeration;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class PagingColumn {
	private int index;
	private String data;
	private String name;
	private boolean searchable;
	private boolean orderable;
	private String searchValue;
	private boolean searchRegex;

	public PagingColumn() {
		super();
	}

	public PagingColumn(HttpServletRequest request, int i) {
		this.setIndex(i);
		this.setData(request.getParameter("columns[" + i + "][data]"));
		this.setName(request.getParameter("columns[" + i + "][name]"));
		this.setOrderable(Boolean.valueOf(request.getParameter("columns[" + i + "][orderable]")));
		this.setSearchRegex(Boolean.valueOf(request.getParameter("columns[" + i + "][search][regex]")));
		this.setSearchValue(request.getParameter("columns[" + i + "][search][value]"));
		this.setSearchable(Boolean.valueOf(request.getParameter("columns[" + i + "][searchable]")));
	}
	
	public static int getNumberOfColumns(HttpServletRequest request) {
		Pattern p = Pattern.compile("columns\\[[0-9]+\\]\\[data\\]");  
		@SuppressWarnings("rawtypes")
		Enumeration params = request.getParameterNames();
		int numOfCol = 0;
		while(params.hasMoreElements()){
			if (p.matcher((String) params.nextElement()).matches()) {
				numOfCol ++ ;
			}
		}
		return numOfCol;
	}

	public PagingColumn(int index, String data, String name, boolean searchable, boolean orderable,
			String searchValue, boolean searchRegex) {
		super();
		this.index = index;
		this.data = data;
		this.name = name;
		this.searchable = searchable;
		this.orderable = orderable;
		this.searchValue = searchValue;
		this.searchRegex = searchRegex;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isSearchable() {
		return searchable;
	}

	public void setSearchable(boolean searchable) {
		this.searchable = searchable;
	}

	public boolean isOrderable() {
		return orderable;
	}

	public void setOrderable(boolean orderable) {
		this.orderable = orderable;
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

}