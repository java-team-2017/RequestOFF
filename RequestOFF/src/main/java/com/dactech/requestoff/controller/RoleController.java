package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.RoleSearchRequest;
import com.dactech.requestoff.model.response.RoleSearchResponse;
import com.dactech.requestoff.service.RoleService;

@RestController
public class RoleController {
	@Autowired
	RoleService roleService;
	
	@RequestMapping(value = "/role/search", method = RequestMethod.POST)
	public RoleSearchResponse search(@RequestBody RoleSearchRequest roleSearchRequest) {
		RoleSearchResponse response;
		try {
			response = roleService.search(roleSearchRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response = new RoleSearchResponse();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		return response;
	}
}
