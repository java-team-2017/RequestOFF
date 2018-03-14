package com.dactech.requestoff.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.EmployeeRole;

public interface EmployeeRoleRepository  extends JpaRepository<EmployeeRole, Long> {
	List<EmployeeRole> findByEmployeeId(long employeeId);	
}
