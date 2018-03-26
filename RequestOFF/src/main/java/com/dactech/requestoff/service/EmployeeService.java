package com.dactech.requestoff.service;

import java.util.List;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.request.EmployeeChangePasswordRequest;
import com.dactech.requestoff.model.request.EmployeeDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatisticsPagingRequest;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatisticsPagingResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;
import com.dactech.requestoff.model.response.GetUserResponse;

public interface EmployeeService {
	EmployeeOffStatisticsPagingResponse employeeOffStatisticsPaging(EmployeeOffStatisticsPagingRequest request) throws Exception;
	
	EmployeeRegistResponse employeeRegist(EmployeeRegistRequest employeeRegistRequest) throws Exception;

	EmployeeSearchResponse employeeSearch(EmployeeSearchRequest employeeSearchRequest);

	EmployeeDetailsResponse employeeDetails(EmployeeDetailsRequest employeeDetailsRequest);
	
	public Employee findByEmail(String email);
	
	public List<GetUserResponse.IdName> findForwardList(long id) throws Exception;
	
	public List<GetUserResponse.IdName> getListRecipients(long employeeId) throws Exception;
	
	public double getRemainHours(long employeeId);
	
	public double getDisplayedRemainHours(long employeeId);
	
	public String getTeamName(long employeeId);
	
	public String getDepartmentName(long employeeId);
	
	public boolean delete(long employeeId) throws Exception;
	
	public boolean isLeader(long employeeId);
	
	public boolean changePassword(EmployeeChangePasswordRequest employeeChangePasswordRequest) throws Exception;
	
	public List<Employee> listEmployeeHaveBirthday();
}
