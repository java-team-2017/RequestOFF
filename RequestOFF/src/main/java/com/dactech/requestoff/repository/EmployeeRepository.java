package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long>{
	public Employee findById(long id);
}
