package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.request.DepartmentDetailsRequest;
import com.dactech.requestoff.model.request.DepartmentInfoRequest;
import com.dactech.requestoff.model.request.DepartmentRegistRequest;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.DepartmentDetailsResponse;
import com.dactech.requestoff.model.response.DepartmentInfoResponse;
import com.dactech.requestoff.model.response.DepartmentRegistResponse;
import com.dactech.requestoff.model.response.DepartmentSearchResponse;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.repository.TeamRepository;
import com.dactech.requestoff.service.DepartmentService;
import com.dactech.requestoff.util.StringUtil;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	TeamRepository teamRepository;
	@Autowired
	RequestRepository requestRepository;
	
	public DepartmentRegistResponse registDepartment(DepartmentRegistRequest departmentRegistRequest) throws Exception {
		Department department;
		
		if(StringUtil.isEmpty(departmentRegistRequest.getId())) {	//create new department
			department = new Department();
			department.setName(departmentRegistRequest.getName());
			
			department.setManagerId(Long.parseLong(departmentRegistRequest.getManagerId()));
			
			department.setValidFlag(Integer.parseInt(departmentRegistRequest.getValidFlag()));
		}
		else {
			department = departmentRepository.findById(Long.parseLong(departmentRegistRequest.getId()));
			if(department == null) {
				throw new Exception("Can not find department with id = " + departmentRegistRequest.getId());
			}
			else if(departmentRegistRequest.getUpdateDate().equals(department.getUpdateDate()) == false) {
				throw new Exception("Someone updated department with id " + departmentRegistRequest.getId() + " at " + department.getUpdateDate());
			}
			else {
				if(StringUtil.isNotEmpty(departmentRegistRequest.getName())) {
					department.setName(departmentRegistRequest.getName());
				}
				if(StringUtil.isNotEmpty(departmentRegistRequest.getManagerId())) {
					long oldManagerId = department.getManagerId();
					long newManagerId = Long.parseLong(departmentRegistRequest.getManagerId());
					
					RequestSearchRequest requestSearchRequest = new RequestSearchRequest();
					requestSearchRequest.setStatus(Integer.toString(Request.REQUEST_STATUS_WAITING));
					requestSearchRequest.setRecipientId(Long.toString(oldManagerId));
					requestSearchRequest.setValidFlag("1");
					
					int requestInProcessing = requestRepository.getNumberOfRequestInProcessing(oldManagerId);
					if (requestInProcessing > 0) { // employee has requests which are in processing
						Employee em = employeeRepository.findById(oldManagerId);
						throw new Exception (em.getName() + " has requests which are in processing. <br/>"
							+ "Please delete or process all those requests before remove");
					}
					List<Request> requests = requestRepository.searchRequest(requestSearchRequest);
					
					if(requests != null && requests.size() > 0) {
						Employee manager = employeeRepository.findById(department.getManagerId());
						throw new Exception(manager.getName()
							+ " has requests waiting for him/her to process. Please let him/her process them before changing to new manager");
					}
					
					department.setManagerId(Long.parseLong(departmentRegistRequest.getManagerId()));
				}
				if(StringUtil.isNotEmpty(departmentRegistRequest.getValidFlag())) {
					department.setValidFlag(Integer.parseInt(departmentRegistRequest.getValidFlag()));
				}
			}
		}
		departmentRepository.save(department);
		
		DepartmentRegistResponse departmentRegistResponse = new DepartmentRegistResponse();
		departmentRegistResponse.setId(department.getId());
		return departmentRegistResponse;
	}
	
	public Department getDepartment(long id) {
		return departmentRepository.findById(id);
	}
	
	public DepartmentSearchResponse search(DepartmentSearchRequest departmentSearchRequest) {
		List<Department> listDepartment = departmentRepository.search(departmentSearchRequest);
		for (Department dept : listDepartment) {
			Employee manager = employeeRepository.findById(dept.getManagerId());
			dept.setManager(new Employee(manager.getId(), manager.getName()));
		}
		DepartmentSearchResponse departmentSearchResponse = new DepartmentSearchResponse(listDepartment);
		return departmentSearchResponse;
	}
	
	@Override
	public DepartmentDetailsResponse details(DepartmentDetailsRequest departmentDetailsRequest) {
		Department department = departmentRepository.findById(Long.parseLong(departmentDetailsRequest.getId()));
		Employee manager = employeeRepository.findById(department.getManagerId());
		department.setManager(new Employee(manager.getId(), manager.getName()));
		DepartmentDetailsResponse departmentDetailsResponse = new DepartmentDetailsResponse(department);
		return departmentDetailsResponse;
	}

	@Override
	public DepartmentInfoResponse departmentInfo(DepartmentInfoRequest departmentInfoRequest) {
		DepartmentInfoResponse response = new DepartmentInfoResponse();
		response.setListManagerNotInDepartment(employeeRepository.findManagerNotInDepartment());
		return response;
	}

	@Override
	public boolean departmentDelete(long departmentId) throws Exception {
		Department department = departmentRepository.findById(departmentId);
		if(department == null) {
			throw new Exception("Can not find department!");
		}
		List<Team> teams = teamRepository.findByDepartmentId(departmentId);
		long managerId = department.getManagerId();
		int requestInProcessing = requestRepository.getNumberOfRequestReceivedInProcessing(managerId);
		if(teams.size() > 0) {
			Employee manager = employeeRepository.findById(department.getManagerId());
			throw new Exception(manager.getName() + " are managing teams that belong to " + department.getName() + " Department. Please remove all teams before deleting Department.");
		} 
		else if(requestInProcessing > 0) {
			Employee em = employeeRepository.findById(managerId);
			throw new Exception (em.getName() + " has requests which are in processing. <br/>"
					+ "Please delete or process all those requests before remove");
		} 
		else {
			departmentRepository.delete(department);
		}
		return true;
	}

	@Override
	public Department findByManagerId(long managerId) {
		return departmentRepository.findByManagerId(managerId);
	}
}
