package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Department;

public interface DepartmentRepository extends JpaRepository<Department, Long>{
	public Department findById(long id);
}
