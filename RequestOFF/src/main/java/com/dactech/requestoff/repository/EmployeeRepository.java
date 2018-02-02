package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.repository.custom.EmployeeRepositoryCustom;

public interface EmployeeRepository extends JpaRepository<Employee, Long>, EmployeeRepositoryCustom{
	public Employee findById(long id);
	public Employee findByEmail(String email);
}
