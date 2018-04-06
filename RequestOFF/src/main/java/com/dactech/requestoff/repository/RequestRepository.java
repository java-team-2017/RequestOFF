package com.dactech.requestoff.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.repository.custom.RequestRepositoryCustom;

public interface RequestRepository extends JpaRepository<Request, Long>, RequestRepositoryCustom{
	public Request findById(long id);
	public List<Request> findByEmployeeId(long employeeId);
	
	@Query(value = "SELECT * FROM request WHERE employee_id = ?1 AND ( from_time BETWEEN ?2 AND ?3 ) "
			+ "AND status = 2 " // approved
			+ "AND valid_flag = 1", nativeQuery = true)
	public List<Request> findByEmpoyeeIdAndTime(long empoyeeId, String from, String to);
	
	@Query(value = "SELECT count(*) FROM request WHERE employee_id = ?1 "
			+ "AND status in (" + Request.REQUEST_STATUS_RESPONDED
			+ ", " + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public int countRequestInProcessing(long employeeId);
	
	@Query(value = "SELECT count(*) FROM request WHERE recipient_id = ?1 "
			+ "AND status in ( " + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public int countRequestReceivedInProcessing(long recipientId);
	
	@Query(value = "SELECT count(*) FROM request WHERE employee_id = ?1 "
			+ " AND recipient_id IN (SELECT employee_id FROM team_employee WHERE team_id = ?2) "
			+ "AND status in (" + Request.REQUEST_STATUS_RESPONDED
			+ ", " + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public int countRequestInProcessingInTeam(long employeeId, long teamId);
	
	@Query(value = "SELECT count(*) FROM request WHERE recipient_id = ?1 "
			+ " AND employee_id IN (SELECT employee_id FROM team_employee WHERE team_id = ?2) "
			+ " AND status in ( " + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public int countRequestReceivedInProcessingInTeam(long recipientId, long teamId);
	
	@Query(value = "SELECT count(*) FROM request WHERE employee_id = ?1 "
			+ " AND recipient_id IN (SELECT employee_id FROM team_employee INNER JOIN team ON team_employee.team_id = team.id WHERE department_id = ?2) "
			+ "AND status in (" + Request.REQUEST_STATUS_RESPONDED
			+ ", " + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public int countRequestInProcessingInDepartment(long employeeId, long departmentId);
	
	@Query(value = "SELECT count(*) FROM request WHERE recipient_id = ?1 "
			+ " AND employee_id IN (SELECT employee_id FROM team_employee INNER JOIN team ON team_employee.team_id = team.id WHERE department_id = ?2) "
			+ " AND status in ( " + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public int countRequestReceivedInProcessingInDepartment(long recipientId, long departmentId);
	
	
	@Query(value = "SELECT * FROM request WHERE recipient_id = ?1 "
			+ " AND employee_id IN (SELECT employee_id FROM team_employee WHERE team_id = ?2) "
			+ " AND status in ( " + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public List<Request> getRequestReceivedInProcessingInTeam(long recipientId, long teamId);
	
	@Query(value = "SELECT * FROM request WHERE recipient_id = ?1 "
			+ " AND employee_id IN (SELECT employee_id FROM team_employee INNER JOIN team ON team_employee.team_id = team.id WHERE department_id = ?2) "
			+ " AND status in ( " + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public List<Request> getRequestReceivedInProcessingInDepartment(long recipientId, long departmentId);
	
	@Query(value = "SELECT * FROM request WHERE employee_id = ?1 "
			+ "AND status in (" + Request.REQUEST_STATUS_WAITING + " ) AND valid_flag = 1", nativeQuery = true)
	public List<Request> getRequestInProcessing(long employeeId);
}
