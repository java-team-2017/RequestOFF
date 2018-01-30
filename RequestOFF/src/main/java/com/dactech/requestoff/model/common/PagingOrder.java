package com.dactech.requestoff.model.common;

import java.util.Enumeration;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class PagingOrder {
	private int column;
	private String dir;

	public PagingOrder() {
		super();
	}
	
	public static int getNumberOfOrder(HttpServletRequest request) {
		Pattern p = Pattern.compile("order\\[[0-9]+\\]\\[column\\]");  
		@SuppressWarnings("rawtypes")
		Enumeration params = request.getParameterNames();
		int numOfOrd = 0;
		while(params.hasMoreElements()){
			if (p.matcher((String) params.nextElement()).matches()) {
				numOfOrd ++ ;
			}
		}
		return numOfOrd;
	}

	public PagingOrder(HttpServletRequest request, int i) {
		this.setColumn(Integer.parseInt(request.getParameter("order[" + i + "][column]")));
		this.setDir(request.getParameter("order[" + i + "][dir]"));
	}

	public PagingOrder(int column, String dir) {
		super();
		this.column = column;
		this.dir = dir;
	}

	public int getColumn() {
		return column;
	}

	public void setColumn(int column) {
		this.column = column;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

}
