package com.dactech.requestoff.service;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.request.DepartmentDetailsRequest;
import com.dactech.requestoff.model.request.DepartmentInfoRequest;
import com.dactech.requestoff.model.request.DepartmentRegistRequest;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;
import com.dactech.requestoff.model.response.DepartmentDetailsResponse;
import com.dactech.requestoff.model.response.DepartmentInfoResponse;
import com.dactech.requestoff.model.response.DepartmentRegistResponse;
import com.dactech.requestoff.model.response.DepartmentSearchResponse;

public interface DepartmentService {
	public DepartmentRegistResponse registDepartment(DepartmentRegistRequest departmentRegistRequest) throws Exception;
	
	public Department getDepartment(long id);
	
	public DepartmentSearchResponse search(DepartmentSearchRequest departmentSearchRequest);
	
	public DepartmentDetailsResponse details(DepartmentDetailsRequest departmentDetailsRequest);
	
	public DepartmentInfoResponse departmentInfo(DepartmentInfoRequest departmentInfoRequest);
	
	boolean departmentDelete(long departmentId) throws Exception;
}
