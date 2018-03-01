package com.dactech.requestoff.model.response;

import java.util.List;

import com.dactech.requestoff.model.common.Common;
import com.dactech.requestoff.model.entity.Role;

public class RoleSearchResponse extends Common {
	private List<Role> listRole;

	public RoleSearchResponse() {
		super();
	}

	public RoleSearchResponse(List<Role> listRole) {
		super();
		this.listRole = listRole;
	}

	public List<Role> getListRole() {
		return listRole;
	}

	public void setListRole(List<Role> listRole) {
		this.listRole = listRole;
	}

}
