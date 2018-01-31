package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.request.TeamDetailsRequest;
import com.dactech.requestoff.model.request.TeamRegistRequest;
import com.dactech.requestoff.model.request.TeamSearchRequest;
import com.dactech.requestoff.model.response.TeamDetailsResponse;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.model.response.TeamSearchResponse;
import com.dactech.requestoff.repository.TeamRepository;
import com.dactech.requestoff.service.TeamService;
import com.dactech.requestoff.util.StringUtil;

/**
 * @author Nguyen Binh Thien
 *
 */
@Service
public class TeamServiceImpl implements TeamService {
	@Autowired
	TeamRepository teamRepository;

	@Override
	public TeamRegistResponse teamRegist(TeamRegistRequest teamRegistRequest) throws Exception {
		Team team;
		if (StringUtil.isEmpty(teamRegistRequest.getId())) { // create new team
			team = new Team();
			
			team.setName(teamRegistRequest.getName());
			
			Employee leader = new Employee();
			leader.setId(Long.parseLong(teamRegistRequest.getLeaderId()));
			team.setLeader(leader);
			
			Department department = new Department();
			department.setId(Long.parseLong(teamRegistRequest.getDepartmentId()));
			team.setDepartment(department);
			
			team.setValidFlag(Integer.parseInt(teamRegistRequest.getValidFlag()));
		} else { //update team
			long teamId = Long.parseLong(teamRegistRequest.getId());
			team = teamRepository.findById(teamId);
			if (team == null) {
				throw new Exception("cannot find the team with id : " + teamId);
			}
			if(!team.getUpdateDate().equals(teamRegistRequest.getUpdateDate())) {
				throw new Exception("Someone updated Team with id " + teamRegistRequest.getId() + " at "
						+ team.getUpdateDate());
			}
			
			if (StringUtil.isNotEmpty(teamRegistRequest.getName())) {
				team.setName(teamRegistRequest.getName());
			}
			
			if (StringUtil.isNotEmpty(teamRegistRequest.getLeaderId())) {
				Employee leader = new Employee();
				leader.setId(Long.parseLong(teamRegistRequest.getLeaderId()));
				team.setLeader(leader);
			}
			
			if (StringUtil.isNotEmpty(teamRegistRequest.getDepartmentId())) {
				Department department = new Department();
				department.setId(Long.parseLong(teamRegistRequest.getDepartmentId()));
				team.setDepartment(department);
			}
			
			if (StringUtil.isNotEmpty(teamRegistRequest.getValidFlag())) {
				team.setValidFlag(Integer.parseInt(teamRegistRequest.getValidFlag()));
			}
		}
		
		teamRepository.save(team);

		return new TeamRegistResponse(team.getId());
	}

	@Override
	public TeamSearchResponse teamSearch(TeamSearchRequest teamSearchRequest) {
		List<Team> teams = teamRepository.searchTeam(teamSearchRequest);
		return new TeamSearchResponse(teams);
	}

	@Override
	public TeamDetailsResponse teamDetails(TeamDetailsRequest teamDetailsRequest) {
		Team team = teamRepository.findById(teamDetailsRequest.getId());
		TeamDetailsResponse response = new TeamDetailsResponse(team);
		return response;
	}

}
