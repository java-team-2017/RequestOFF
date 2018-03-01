package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Role;
import com.dactech.requestoff.model.request.RoleSearchRequest;
import com.dactech.requestoff.model.response.RoleSearchResponse;
import com.dactech.requestoff.repository.RoleRepository;
import com.dactech.requestoff.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	RoleRepository roleRepository;
	
	@Override
	public RoleSearchResponse search(RoleSearchRequest roleSearchRequest) {
		List<Role> roles = roleRepository.search(roleSearchRequest);
		return new RoleSearchResponse(roles);
	}
}
