package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.Department;

public interface DepartmentRepositoryCustom {
	public List<Department> search(long id, String name, long managerId, int validFlag);
}
