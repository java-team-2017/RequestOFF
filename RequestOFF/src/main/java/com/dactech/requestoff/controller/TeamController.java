package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.TeamRegistRequest;
import com.dactech.requestoff.model.request.TeamSearchRequest;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.model.response.TeamSearchResponse;
import com.dactech.requestoff.service.TeamService;

@RestController
public class TeamController {
	@Autowired
	TeamService teamService;

	@RequestMapping(value = "/team_regist")
	public TeamRegistResponse teamRegist(@RequestBody TeamRegistRequest teamRegistRequest) {
		TeamRegistResponse response = new TeamRegistResponse();
		StatusInfo statusInfo = null;
		try {
			response = teamService.teamRegist(teamRegistRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}

	@RequestMapping(value = "/team_search", method = RequestMethod.POST)
	public TeamSearchResponse teamSearch(@RequestBody TeamSearchRequest teamSearchRequest) {
		return teamService.teamSearch(teamSearchRequest);
	}
}
