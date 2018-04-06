package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.entity.TeamEmployee;
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
	@Autowired
	TeamEmployee teamEmployee;
	
	public DepartmentRegistResponse registDepartment(DepartmentRegistRequest departmentRegistRequest) throws Exception {
		Department department;
		
		if(StringUtil.isEmpty(departmentRegistRequest.getId())) {	//create new department
			department = new Department();
			department.setName(departmentRegistRequest.getName());
			
			department.setManagerId(Long.parseLong(departmentRegistRequest.getManagerId()));
			
			department.setValidFlag(Integer.parseInt(departmentRegistRequest.getValidFlag()));
		}
		else {	//update department
			department = departmentRepository.findById(Long.parseLong(departmentRegistRequest.getId()));
			if(department == null) {
				throw new Exception("Không thể tìm department với id " + departmentRegistRequest.getId());
			}
			else if(departmentRegistRequest.getUpdateDate().equals(department.getUpdateDate()) == false) {
				throw new Exception("Department với id " + departmentRegistRequest.getId() + " đã được chỉnh sửa vào lúc " + department.getUpdateDate()
									+ ".<br/>Vui lòng tải lại trang để cập nhật thông tin mới nhất");
			}
			else {
				if(StringUtil.isNotEmpty(departmentRegistRequest.getName())) {
					department.setName(departmentRegistRequest.getName());
				}
				if(StringUtil.isNotEmpty(departmentRegistRequest.getManagerId())) {
					long id = department.getId();
					long oldManagerId = department.getManagerId();
					long newManagerId = Long.parseLong(departmentRegistRequest.getManagerId());
					if (oldManagerId != newManagerId) {
//						RequestSearchRequest requestSearchRequest = new RequestSearchRequest();
//						requestSearchRequest.setStatus(Integer.toString(Request.REQUEST_STATUS_WAITING));
						
//						requestSearchRequest.setRecipientId(Long.toString(oldManagerId));
//						requestSearchRequest.setValidFlag("1");
//						int requestInProcessing = requestRepository.countRequestInProcessingInDepartment(oldManagerId, id);
						List<Request> requestReceivedInProcessing = requestRepository.getRequestReceivedInProcessingInDepartment(oldManagerId, id);
						if ( requestReceivedInProcessing.size() > 0) {
							Employee em = employeeRepository.findById(oldManagerId);
//							TeamEmployee teamEmployee = team
							for(Request listRequest : requestReceivedInProcessing) {
								listRequest.setRecipientId(newManagerId);
							}
							List<Request> requestList = requestRepository.findByEmployeeId(newManagerId);
							for(Request listRequest : requestList) {
								listRequest.setStatus(Request.REQUEST_STATUS_APPROVED);
							}
//							throw new Exception(em.getName()
//									+ " có request đang chờ anh ấy/cô ấy xử lý.<br/>Vui lòng để anh ấy/cô ấy xử lý trước khi thay đổi manager mới");
						}
						
						
//						requestInProcessing = requestRepository.countRequestInProcessingInDepartment(newManagerId, id);
//						requestReceivedInProcessing = requestRepository.countRequestReceivedInProcessingInDepartment(newManagerId, id);
//						if (requestInProcessing > 0 || requestReceivedInProcessing > 0) {
//							Employee em = employeeRepository.findById(newManagerId);
//							throw new Exception (em.getName() + " có request đang chờ được xử lý.<br/>"
//									+ "Vui lòng xử lý tất cả request trước khi xóa");
//						}
						
//						List<Request> requests = requestRepository.searchRequest(requestSearchRequest);
//						
//						if(requests != null && requests.size() > 0) {
//							Employee manager = employeeRepository.findById(department.getManagerId());
//							throw new Exception(manager.getName()
//								+ " có request đang chờ anh ấy/cô ấy xử lý.<br/>Vui lòng để anh ấy/cô ấy xử lý trước khi thay đổi manager mới");
//						}
						
						department.setManagerId(newManagerId);
					}
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
			throw new Exception("Không thể tìm thấy department với id " + departmentId);
		}
		List<Team> teams = teamRepository.findByDepartmentId(departmentId);
		long managerId = department.getManagerId();
		long id = department.getId();
		List<Request> requestInProcessing = requestRepository.getRequestReceivedInProcessingInDepartment(managerId, id);
		if(teams.size() > 0) {
//			Employee manager = employeeRepository.findById(department.getManagerId());
			throw new Exception("Vui lòng xóa tất cả team thuộc " + department.getName() + " Department trước khi xóa " + department.getName() +" Department.");
		} 
//		else
		if(requestInProcessing.size() > 0) {
			Employee em = employeeRepository.findById(managerId);
			throw new Exception (em.getName() + " có request đang chờ được xử lý. <br/>"
					+ "Vui lòng xử lý tất cả request trước khi xóa");
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
