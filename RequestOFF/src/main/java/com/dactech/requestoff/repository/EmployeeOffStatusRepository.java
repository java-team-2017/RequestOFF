package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.repository.custom.EmployeeOffStatusRepositoryCustom;

public interface EmployeeOffStatusRepository extends JpaRepository<EmployeeOffStatus, Long>, EmployeeOffStatusRepositoryCustom {

	@Query(value = "SELECT * FROM employee_off_status WHERE year_id = ?1 AND employee_id = ?2", nativeQuery = true)
	public EmployeeOffStatus findById(long yearId, long employeeId);

}
