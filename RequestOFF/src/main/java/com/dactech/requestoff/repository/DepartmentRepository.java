package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.repository.custom.DepartmentRepositoryCustom;

public interface DepartmentRepository extends JpaRepository<Department, Long>, DepartmentRepositoryCustom {
	public Department findById(long id);
}
