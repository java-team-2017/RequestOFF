package com.dactech.requestoff.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.repository.custom.EmployeeRepositoryCustom;

public interface EmployeeRepository extends JpaRepository<Employee, Long>, EmployeeRepositoryCustom{
	public Employee findById(long id);
	public Employee findByEmail(String email);
	
	@Query(value = "SELECT * FROM employee WHERE name like %?1% ", nativeQuery = true)
	public List<Employee> findByNameLike(String name);
	
	@Query(value = "SELECT * FROM employee e INNER JOIN position p ON e.position_id = p.id "
			+ "WHERE code = " + Position.CODE_EMPLOYEE + " AND "
			+ "e.id NOT IN (SELECT DISTINCT employee_id from team_employee WHERE valid_flag = 1) AND "
			+ "e.valid_flag = 1", nativeQuery = true)
	public List<Employee> findEmployeeNotInTeam();
	
//	@Query(value = "SELECT * FROM employee e INNER JOIN position p ON e.position_id = p.id "
//			+ "WHERE code = " + Position.CODE_LEADER + " AND "
//			+ "e.id NOT IN (SELECT DISTINCT leader_id from team WHERE valid_flag = 1) AND "
//			+ "e.valid_flag = 1", nativeQuery = true)
//	public List<Employee> findLeaderNotInTeam();
	
	@Query(value = "SELECT * FROM employee e INNER JOIN position p ON e.position_id = p.id "
			+ "WHERE code = " + Position.CODE_MANAGER + " AND "
			+ "e.id NOT IN (SELECT DISTINCT manager_id from department WHERE valid_flag = 1) AND "
			+ "e.valid_flag = 1", nativeQuery = true)
	public List<Employee> findManagerNotInDepartment();
	
	@Query(value = "SELECT * FROM employee WHERE "
			+ "id IN (SELECT DISTINCT employee_id from team_employee WHERE valid_flag = 1 AND team_id = ?1) AND "
			+ "valid_flag = 1", nativeQuery = true)
	public List<Employee> findByTeamId(long teamId);
}
