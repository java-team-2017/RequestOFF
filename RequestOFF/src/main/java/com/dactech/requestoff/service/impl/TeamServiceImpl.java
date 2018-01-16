package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.request.TeamRegistRequest;
import com.dactech.requestoff.model.request.TeamSearchRequest;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.model.response.TeamSearchResponse;
import com.dactech.requestoff.repository.TeamRepository;
import com.dactech.requestoff.service.TeamService;

/**
 * @author Nguyen Binh Thien
 *
 */
@Service
public class TeamServiceImpl implements TeamService {
	@Autowired
	TeamRepository teamRepository;

	@Override
	public TeamRegistResponse teamRegist(TeamRegistRequest teamRegistRequest) {
		Team team;
		Department department = new Department();
		department.setId(teamRegistRequest.getDepartmentId());
		Employee leader = new Employee();
		leader.setId(teamRegistRequest.getLeaderId());

		if (teamRegistRequest.getId() == 0) { // register new team
			team = new Team();
		} else { // update team
			team = teamRepository.findById(teamRegistRequest.getId());
		}

		team.setValidFlag(teamRegistRequest.getValidFlag());
		team.setName(teamRegistRequest.getName());
		team.setDepartment(department);
		team.setLeader(leader);

		teamRepository.save(team);

		return new TeamRegistResponse(team.getId());
	}

	@Override
	public TeamSearchResponse teamSearch(TeamSearchRequest teamSearchRequest) {
		List<Team> teams = teamRepository.searchTeam(teamSearchRequest);
		return new TeamSearchResponse(teams);
	}

}
