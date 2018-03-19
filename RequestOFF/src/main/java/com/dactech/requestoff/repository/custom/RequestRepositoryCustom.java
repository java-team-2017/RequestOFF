package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.RequestBrowsingRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.request.RequestViewRequest;

public interface RequestRepositoryCustom {
	public List<Request> searchRequest(RequestSearchRequest requestSearchRequest);
	
	public List<Request> browseRequest(RequestBrowsingRequest request) throws Exception;
	
	public List<Request> viewRequest(RequestViewRequest request) throws Exception;
	
	//get requests having paid day off type and status saved/waiting/responded of an employee
	public List<Request> getChangeDisplayedRemainHoursRequest(long employeeId);
}
