package com.dactech.requestoff.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.request.RequestBrowsingRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.TeamRepository;
import com.dactech.requestoff.repository.custom.RequestRepositoryCustom;
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

	@Override
	public List<Request> browseRequest(RequestBrowsingRequest requests) {
		Employee user = employeeRepository.findById(Long.parseLong(requests.getUserId()));
		StringBuilder queryString = new StringBuilder("SELECT * FROM request INNER JOIN employee ON request.employee_id = employee.id WHERE ");
		if (user.getPosition().getCode() != 0) { //uncorrect
			queryString.append(" (employee_id IN (SELECT employee_id from team t INNER JOIN team_employee te ON t.id = te.team_id WHERE t.leader_id = " + requests.getUserId() + ")) ");
		} else if (user.getPosition().getCode() == Position.CODE_MANAGER) {
			queryString.append(" (employee_id IN (SELECT employee_id from team_employee te INNER JOIN team t ON t.id=te.team_id INNER JOIN department d ON d.id=t.department_id WHERE manager_id= " + requests.getUserId() + ") "
					+ "OR employee_id IN (SELECT leader_id FROM team t INNER JOIN department d ON t.department_id=d.id WHERE manager_id= " + requests.getUserId() + " )) ");
		}
		
		if (StringUtil.isNotEmpty(requests.getStatus())) {
			if (requests.getStatus().equals("5")) {
				queryString.append(" AND status = '5' AND recipient_id = '" + requests.getUserId() + "'");
			} else {
				queryString.append(" AND status = '" + requests.getStatus() + "'");
			}
		} else {
			queryString.append(" AND NOT (status = '5' AND recipient_id <> '" + requests.getUserId() + "')");
		}
		
		queryString.append(" AND status <> 1 AND status <> 4"); // eliminate saved and responded request
		
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
		@SuppressWarnings("unchecked")
		List<Request> listRequests = query.getResultList();
		
		for (Request request : listRequests) {
			Employee recipient = employeeRepository.findById(request.getRecipientId());
			Employee sender = request.getEmployee();
			// set recipient Name
			request.setRecipientName(recipient.getName());
			
			// set forward ID and name
			if(request.getStatus() == Request.REQUEST_STATUS_WAITING) {
				if (recipient.getPosition().getCode() != 0) {//uncorrect
					String queryStr = "SELECT * FROM employee e INNER JOIN department d ON e.id = d.manager_id "
							+ " INNER JOIN team t ON t.department_id = d.id"
							+ " WHERE t.leader_id = " + recipient.getId();
					Query queryObj = entityManager.createNativeQuery(queryStr.toString(), Employee.class);
					Employee manager = (Employee) queryObj.getSingleResult();
					request.setForwardId(manager.getId());
					request.setForwardName(manager.getName());
				} else if (recipient.getPosition().getCode() == Position.CODE_MANAGER) {
					if (sender.getPosition().getCode() != 0 /* uncorrect */ && sender.getPosition().getCode() != Position.CODE_MANAGER) {
						String queryStr = "SELECT * from employee e INNER JOIN team t on e.id = t.leader_id INNER JOIN team_employee te ON t.id = te.team_id "
								+ "WHERE te.employee_id = " + request.getEmployee().getId();
						Query queryObj = entityManager.createNativeQuery(queryStr.toString(), Employee.class);
						Employee leader = (Employee) queryObj.getSingleResult();
						request.setForwardId(leader.getId());
						request.setForwardName(leader.getName());
					}
				}
			}
			
			// set department name and team name for request sender
			
			if (sender.getPosition().getCode() != 0) { //uncorrect
				Team team = teamRepository.findByLeaderId(sender.getId());
				if (team != null) {
					sender.setTeamName(team.getName());
					sender.setDepartmentName(team.getDepartment().getName());
				} else {
					sender.setTeamName("No Team");
				}
			} else if (sender.getPosition().getCode() == Position.CODE_MANAGER) {
				Department dept = departmentRepository.findByManagerId(sender.getId());
				if (dept != null) {
					sender.setTeamName("");
					sender.setDepartmentName(dept.getName());
				} else {
					sender.setDepartmentName("No Department");
				}
			} else if(sender.getPosition().getCode() == Position.CODE_EMPLOYEE) {
				Employee employee = employeeRepository.findById(sender.getId());
				if(employee != null) {
					sender.setTeamName(employee.getTeamName());
					sender.setDepartmentName(employee.getDepartmentName());
				}
			}
		}
		return listRequests;
	}

}
