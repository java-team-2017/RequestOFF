package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Role;
import com.dactech.requestoff.repository.custom.RoleRepositoryCustom;

public interface RoleRepository extends JpaRepository<Role, Long>, RoleRepositoryCustom {
	public Role findById(long id);
}
