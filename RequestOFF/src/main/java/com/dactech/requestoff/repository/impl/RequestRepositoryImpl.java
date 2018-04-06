package com.dactech.requestoff.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.entity.Role;
import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.entity.TeamEmployee;
import com.dactech.requestoff.model.request.RequestBrowsingRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.request.RequestViewRequest;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.TeamEmployeeRepository;
import com.dactech.requestoff.repository.TeamRepository;
import com.dactech.requestoff.repository.custom.RequestRepositoryCustom;
import com.dactech.requestoff.service.CompanyYearOffService;
import com.dactech.requestoff.util.StringUtil;

public class RequestRepositoryImpl implements RequestRepositoryCustom {
	@PersistenceContext
	EntityManager entityManager;
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	TeamRepository teamRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	TeamEmployeeRepository teamEmployeeRepository;
	@Autowired
	CompanyYearOffService companyYearOffService;
	@Override
	public List<Request> searchRequest(RequestSearchRequest requestSearchRequest) {
		StringBuilder queryString = new StringBuilder("SELECT * FROM request INNER JOIN employee ON request.employee_id = employee.id ");
		StringBuilder whereClause = new StringBuilder("");
		
		if (StringUtil.isNotEmpty(requestSearchRequest.getNameOfEmployee())) {
			whereClause.append(" AND name like '%" + requestSearchRequest.getNameOfEmployee() + "%'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getId())) {
			whereClause.append(" AND request.id = '" + requestSearchRequest.getId() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getEmployeeId())) {
			whereClause.append(" AND employee_id = '" + requestSearchRequest.getEmployeeId() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getReason())) {
			whereClause.append(" AND reason like '%" + requestSearchRequest.getReason() + "%'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getStatus())) {
			whereClause.append(" AND status = '" + requestSearchRequest.getStatus() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getResponseMessage())) {
			whereClause.append(" AND response_message like '%" + requestSearchRequest.getResponseMessage() + "%'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getDayOffTypeId())) {
			whereClause.append(" AND day_off_type_id = '" + requestSearchRequest.getDayOffTypeId() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getRecipientId())) {
			whereClause.append(" AND recipient_id = '" + requestSearchRequest.getRecipientId() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getFromTime())) {
			whereClause.append(" AND to_time >= '" + requestSearchRequest.getFromTime() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getToTime())) {
			whereClause.append(" AND from_time <= '" + requestSearchRequest.getToTime() + "'");
		}
		
		if (StringUtil.isNotEmpty(requestSearchRequest.getTotalTime())) {
			whereClause.append(" AND total_time = '" + requestSearchRequest.getTotalTime() + "'");
		}

		if (StringUtil.isNotEmpty(requestSearchRequest.getValidFlag())) {
			whereClause.append(" AND request.valid_flag = '" + requestSearchRequest.getValidFlag() + "'");
		}

		if (whereClause.length() > 0) {
			whereClause.replace(0, 5, " WHERE ");
			queryString.append(whereClause);
		} 
		Query query = entityManager.createNativeQuery(queryString.toString(), Request.class);
		@SuppressWarnings("unchecked")
		List<Request> requests = query.getResultList();
		return requests;
	}

	@SuppressWarnings({ "unchecked", "null" })
	@Override
	public List<Request> browseRequest(RequestBrowsingRequest requests) throws Exception {
		Employee user = employeeRepository.findById(Long.parseLong(requests.getUserId()));
		if (user == null) {
			throw new Exception("Người đăng nhập " + user.getName() + " không tìm thấy");
		}
		StringBuilder queryString = new StringBuilder("SELECT * FROM request INNER JOIN employee ON request.employee_id = employee.id WHERE ");
		
		if (user.getPosition().getCode() == Position.CODE_EMPLOYEE) {	
			TeamEmployee teamEmployee = teamEmployeeRepository.findByEmployeeId(Long.parseLong(requests.getUserId()));
			if (teamEmployee == null) {
				throw new Exception("Người đăng nhập " + user.getName() + " không thuộc bất cứ team nào");
			}
			if (teamEmployee.getLeaderFlag() == 1) { //user is a leader
				queryString.append(" (employee_id IN (SELECT employee_id from team t INNER JOIN team_employee te ON t.id = te.team_id WHERE t.leader_id = " + requests.getUserId() + ")) ");
			} else {
				throw new Exception("Người đăng nhập " + user.getName() + " không có quyền sử dụng chức năng này");
			}
		} else if (user.getPosition().getCode() == Position.CODE_MANAGER) {
			queryString.append(" (employee_id IN (SELECT employee_id from team_employee te INNER JOIN team t ON t.id=te.team_id INNER JOIN department d ON d.id=t.department_id WHERE manager_id= " + requests.getUserId() + ") "
					+ " OR employee_id IN (SELECT employee_id from team t INNER JOIN team_employee te ON t.id = te.team_id WHERE t.leader_id = " + requests.getUserId() + " )) ");
		}
		
		queryString.append(" AND employee.id <> " + user.getId());
		
		if (StringUtil.isNotEmpty(requests.getStatus())) {
				queryString.append(" AND status = '" + requests.getStatus() + "'");
		} else {
			queryString.append(" AND status <> 1 AND status <> 4"); // eliminate saved and responded request
		}
		
		if (StringUtil.isNotEmpty(requests.getName())) {
			queryString.append(" AND employee.name like '%" + requests.getName() + "%'");
		}
		
		if (StringUtil.isNotEmpty(requests.getFromTime())) {
			queryString.append(" AND to_time >= '" + requests.getFromTime() + "'");
		}

		if (StringUtil.isNotEmpty(requests.getToTime())) {
			queryString.append(" AND from_time <= '" + requests.getToTime() + "'");
		}
		
		queryString.append(" AND request.valid_flag = '1'");
	
		Query query = entityManager.createNativeQuery(queryString.toString(), Request.class);
		List<Request> listRequests = query.getResultList();
		
		for (Request request : listRequests) {
			Employee recipient = employeeRepository.findById(request.getRecipientId());
			Employee sender = request.getEmployee();
			TeamEmployee recipientTeamEmployee = teamEmployeeRepository.findByEmployeeId((request.getRecipientId()));
			TeamEmployee teamEmployee = teamEmployeeRepository.findByEmployeeId((sender.getId()));
			// set recipient Name
			request.setRecipientName(recipient.getName());
			
//			// set forward ID and name
//			if(request.getStatus() == Request.REQUEST_STATUS_WAITING) {
//				if (recipient.getPosition().getCode() == Position.CODE_EMPLOYEE) {
//					if(recipientTeamEmployee != null && recipientTeamEmployee.getLeaderFlag() == 1) {// recipient is a leader, forward to manager
//						Department employeeDepartment = recipient.getListTeam().get(0).getDepartment();
//						if(employeeDepartment != null) {
//							Employee manager = employeeRepository.findById(employeeDepartment.getManagerId());
//							if(manager != null) {
//								request.setForwardId(manager.getId());
//								request.setForwardName(manager.getName());
//							}
//						}
////						String queryStr = "SELECT * FROM employee e INNER JOIN department d ON e.id = d.manager_id "
////								+ " INNER JOIN team t ON t.department_id = d.id"
////								+ " WHERE t.leader_id = " + recipient.getId();
////						Query queryObj = entityManager.createNativeQuery(queryStr.toString(), Employee.class);
////						List<Employee> managers = queryObj.getResultList();
//					}
//					else {
//						throw new Exception("Người đăng nhập " + request.getRecipientName() + " chỉ là thành viên trong team");
//					}
//				} else if (recipient.getPosition().getCode() == Position.CODE_MANAGER) {
//					if(recipientTeamEmployee != null && recipientTeamEmployee.getLeaderFlag() == 1) {//user is manager and leader
//						if (sender.getPosition().getCode() == Position.CODE_EMPLOYEE) {//sender is employee
//							if(teamEmployee != null && teamEmployee.getLeaderFlag() == 1 && sender.getPosition().getCode() == Position.CODE_MANAGER ) {
//								String queryStr = "SELECT * from employee e INNER JOIN team t on e.id = t.leader_id INNER JOIN team_employee te ON t.id = te.team_id "
//										+ "WHERE te.employee_id = " + request.getEmployee().getId() + " AND e.id <> " + recipient.getId();
//								Query queryObj = entityManager.createNativeQuery(queryStr.toString(), Employee.class);
//								List<Employee> leader = queryObj.getResultList();
//								if(leader != null && leader.size() > 0) {
//									request.setForwardId(leader.get(0).getId());
//									request.setForwardName(leader.get(0).getName());
//								}
//							} 
//						} 
//					} else { //user is just manager
//						if (sender.getPosition().getCode() == Position.CODE_EMPLOYEE) {
//							if(teamEmployee != null && teamEmployee.getLeaderFlag() != 1 && sender.getPosition().getCode() != Position.CODE_MANAGER ) {
//								String queryStr = "SELECT * FROM employee e INNER JOIN team t on e.id = t.leader_id INNER JOIN team_employee te ON t.id = te.team_id "
//										+ "WHERE te.employee_id = " + request.getEmployee().getId();
//								Query queryObj = entityManager.createNativeQuery(queryStr.toString(), Employee.class);
//								List<Employee> leader = queryObj.getResultList();
//								if(leader != null && leader.size() > 0) {
//									request.setForwardId(leader.get(0).getId());
//									request.setForwardName(leader.get(0).getName());
//								}
//							} 
//						}
//					}
//				}
//			}
			
//			// set department name and team name for request sender
//			if(sender.getPosition().getCode() == Position.CODE_EMPLOYEE) {
//				if(teamEmployee != null && teamEmployee.getValidFlag() == 1) {
//					Team team = teamRepository.findByLeaderId(sender.getId());
//					if (team != null) {
//						sender.setTeamName(team.getName());
//						sender.setDepartmentName(team.getDepartment().getName());
//					} else {
//						sender.setTeamName("Không có team");
//					}
//				}
//			} else if (sender.getPosition().getCode() == Position.CODE_MANAGER) {
//				Department dept = departmentRepository.findByManagerId(sender.getId());
//				if (dept != null) {
//					sender.setTeamName("");
//					sender.setDepartmentName(dept.getName());
//				} else {
//					sender.setDepartmentName("Không có Department");
//				}
//			} else {
//				Employee employee = employeeRepository.findById(sender.getId());
//				if(employee != null) {
//					sender.setTeamName(employee.getTeamName());
//					sender.setDepartmentName(employee.getDepartmentName());
//				}
//			}
		}
		return listRequests;
	}
	
	@Override
	public List<Request> getChangeDisplayedRemainHoursRequest(long employeeId) {
		String sqlQuery = "SELECT * FROM request INNER JOIN day_off_type ON request.day_off_type_id = day_off_type.id WHERE request.employee_id = " + employeeId
							+ " AND (status = " + Request.REQUEST_STATUS_SAVED + " OR status = " + Request.REQUEST_STATUS_WAITING
							+ " OR status = " + Request.REQUEST_STATUS_RESPONDED + ") AND payment_flag = "
							+ DayOffType.PAYMENT_FLAG_PAYING + " AND request.valid_flag = 1";
		
		System.out.println(sqlQuery + "\n\n\n\n");
		
		Query query = entityManager.createNativeQuery(sqlQuery.toString(), Request.class);
		@SuppressWarnings("unchecked")
		List<Request> requests = query.getResultList();
		
		List<Request> currentYearRequests = new ArrayList<Request>();
		long currentYear = companyYearOffService.getCurrentYear();
		for(Request r : requests) {
			if(Long.parseLong(r.getToTime().substring(0, 4)) == currentYear) {
				currentYearRequests.add(r);
			}
		}
		currentYearRequests.size();
		return currentYearRequests;
	}

	@SuppressWarnings({ "null", "unchecked" })
	@Override
	public List<Request> viewRequest(RequestViewRequest request) throws Exception {
		Employee user = employeeRepository.findById(Long.parseLong(request.getUserId()));
		if (user == null) {
			throw new Exception("User " + user.getName() + " is not found");
		}
		StringBuilder queryString = new StringBuilder("SELECT * FROM request INNER JOIN employee e ON request.employee_id = e.id INNER JOIN team_employee te ON te.employee_id = e.id INNER JOIN team t ON t.id = te.team_id INNER JOIN department d ON d.id = t.department_id WHERE ");
		if(user.getListRole().get(0).getRole().equals(Role.ROLE_HR)) {
			queryString.append(" status <> 1 AND e.id <> " + user.getId());
		} 
		else {
			throw new Exception("Người đăng nhập " + user.getName() + " không phải là HR");
		}
		
		if (StringUtil.isNotEmpty(request.getEmployeeName())) {
			queryString.append(" AND e.name like '%" + request.getEmployeeName() + "%'");
		}
		
		if (StringUtil.isNotEmpty(request.getStatus())) {
			queryString.append(" AND status = '" + request.getStatus() + "'");
		}
		
		if (StringUtil.isNotEmpty(request.getFromTime())) {
			queryString.append(" AND to_time >= '" + request.getFromTime() + "'");
		}

		if (StringUtil.isNotEmpty(request.getToTime())) {
			queryString.append(" AND from_time <= '" + request.getToTime() + "'");
		}
		
		if (StringUtil.isNotEmpty(request.getDepartmentId())) {
			queryString.append(" AND d.id = '" + request.getDepartmentId() + "'");
		}
		
		if (StringUtil.isNotEmpty(request.getTeamId())) {
			queryString.append(" AND t.id = '" + request.getTeamId() + "'");
		}
		
		queryString.append(" AND request.valid_flag = '1'");
		
		Query query = entityManager.createNativeQuery(queryString.toString(), Request.class);
		List<Request> listRequests = query.getResultList();
		
		for (Request requests : listRequests) {
			Employee recipient = employeeRepository.findById(requests.getRecipientId());
			requests.setRecipientName(recipient.getName());
		}
		return listRequests;
	}

}
