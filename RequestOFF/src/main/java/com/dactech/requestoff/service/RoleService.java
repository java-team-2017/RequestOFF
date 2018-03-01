package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.RoleSearchRequest;
import com.dactech.requestoff.model.response.RoleSearchResponse;

public interface RoleService {
	public RoleSearchResponse search(RoleSearchRequest roleSearchRequest);
}
