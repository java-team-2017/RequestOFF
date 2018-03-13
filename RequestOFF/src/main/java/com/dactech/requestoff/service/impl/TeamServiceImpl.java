package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.entity.TeamEmployee;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.request.TeamDetailsRequest;
import com.dactech.requestoff.model.request.TeamEditInfoRequest;
import com.dactech.requestoff.model.request.TeamRegistRequest;
import com.dactech.requestoff.model.request.TeamSearchRequest;
import com.dactech.requestoff.model.response.TeamDetailsResponse;
import com.dactech.requestoff.model.response.TeamEditInfoResponse;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.model.response.TeamSearchResponse;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.repository.TeamEmployeeRepository;
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
	@Autowired
	TeamEmployeeRepository TERepository;
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	RequestRepository requestRepository;

	@Override
	@Transactional
	public TeamRegistResponse teamRegist(TeamRegistRequest teamRegistRequest) throws Exception {
		Team team;
		if (StringUtil.isEmpty(teamRegistRequest.getId())) { // create new team
			team = new Team();
			
			team.setName(teamRegistRequest.getName());
			
			team.setLeaderId(Long.parseLong(teamRegistRequest.getLeaderId()));
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
				long newLeaderId = Long.parseLong(teamRegistRequest.getLeaderId());
				long oldLeaderId = team.getLeaderId();
				if (oldLeaderId != newLeaderId) { // change leader
					// check whether old leader has wating requests which need to process
					
//					RequestSearchRequest requestSearchRequest = new RequestSearchRequest();
//					requestSearchRequest.setStatus(Integer.toString(Request.REQUEST_STATUS_WAITING));
//					requestSearchRequest.setRecipientId(Long.toString(oldLeaderId));
//					requestSearchRequest.setValidFlag("1");
//					
//					List<Request> requests = requestRepository.searchRequest(requestSearchRequest);
//					if (requests != null && requests.size() >0) {
					int numOfRequest = requestRepository.getNumberOfRequestReceivedInProcessing(oldLeaderId);
					if (numOfRequest > 0) {
						Employee leader = employeeRepository.findById(oldLeaderId);
						throw new Exception(leader.getName()
							+ " has requests waiting for him to process. <br/>Please let him process them before changing to new leader");
					}
					
					int requestInProcessing = requestRepository.getNumberOfRequestInProcessing(oldLeaderId);
					if (requestInProcessing > 0) { // employee has requests which are in processing
						Employee em = employeeRepository.findById(oldLeaderId);
						throw new Exception (em.getName() + " has requests which are in processing. <br/>"
								+ "Please delete or process all those requests before remove");
					}
					team.setLeaderId(newLeaderId);
				}
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
		if (teamRegistRequest.getListMember() != null) {
			long teamId = team.getId();
			List<TeamEmployee> TEmployees = TERepository.findByTeamId(teamId); // old member list of team
			for (String member : teamRegistRequest.getListMember()) {
				long memberId = Long.parseLong(member);
				TeamEmployee te = TERepository.findByTeamIdAndEmployeeId(teamId, memberId);
				if (te == null) {
					TeamEmployee teamEmployee = new TeamEmployee();
					teamEmployee.setTeamId(teamId);
					teamEmployee.setEmployeeId(memberId);
					teamEmployee.setValidFlag(1);
					TERepository.save(teamEmployee);
				} else {
					TEmployees.remove(te);
				}
			}
			for (TeamEmployee te : TEmployees) {
				int requestInProcessing = requestRepository.getNumberOfRequestInProcessing(te.getEmployeeId());
				if (requestInProcessing > 0) { // employee has requests which are in processing
					Employee em = employeeRepository.findById(te.getEmployeeId());
					throw new Exception (em.getName() + " has requests which are in processing. <br/>"
							+ "Please delete or process all those requests before remove");
				}
				TERepository.delete(te);
			}
		}
		
		return new TeamRegistResponse(team.getId());
	}

	@Override
	public TeamSearchResponse teamSearch(TeamSearchRequest teamSearchRequest) {
		List<Team> teams = teamRepository.searchTeam(teamSearchRequest);
		for (Team team : teams) {
			Employee leader = employeeRepository.findById(team.getLeaderId());
			team.setLeader(new Employee(leader.getId(), leader.getName()));
		}
		return new TeamSearchResponse(teams);
	}

	@Override
	public TeamDetailsResponse teamDetails(TeamDetailsRequest teamDetailsRequest) {
		Team team = teamRepository.findById(Long.parseLong(teamDetailsRequest.getId()));
		Employee leader = employeeRepository.findById(team.getLeaderId());
		team.setLeader(new Employee(leader.getId(), leader.getName()));
		TeamDetailsResponse response = new TeamDetailsResponse(team);
		return response;
	}

	@Override
	public TeamEditInfoResponse teamEditInfo(TeamEditInfoRequest request) {
		TeamEditInfoResponse response = new TeamEditInfoResponse();
		if (StringUtil.isNotEmpty(request.getTeamId())) {
			long teamId = Long.parseLong(request.getTeamId());
			Team team = teamRepository.findById(teamId);
			response.setCurrentLeaderId(team.getLeaderId());
			List<Employee> listMember = employeeRepository.findByTeamId(teamId); 
			response.setListMember(listMember);
		}
		response.setListMemberNotInTeam(employeeRepository.findEmployeeNotInTeam());
		response.setListDepartment(departmentRepository.findAll());
		
		return response;
	}

	@Override
	@Transactional
	public boolean teamDelete(long teamId) {
		Team team = teamRepository.findById(teamId);
		if (team == null) {
			return false;
		}
		
		List<TeamEmployee> listTE = TERepository.findByTeamId(teamId);
		for (TeamEmployee te : listTE) {
			TERepository.delete(te);
		}
		
		teamRepository.delete(team);
		return true;
	}

}
