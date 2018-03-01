package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.Role;
import com.dactech.requestoff.model.request.RoleSearchRequest;

public interface RoleRepositoryCustom {
	public List<Role> search(RoleSearchRequest roleSearchRequest);
}
