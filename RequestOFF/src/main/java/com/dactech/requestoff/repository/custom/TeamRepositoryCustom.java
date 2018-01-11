package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.request.TeamSearchRequest;

public interface TeamRepositoryCustom {
	public List<Team> searchTeam(TeamSearchRequest teamSearchRequest); 
}
