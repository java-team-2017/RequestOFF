package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.TeamDeleteRequest;
import com.dactech.requestoff.model.request.TeamDetailsRequest;
import com.dactech.requestoff.model.request.TeamEditInfoRequest;
import com.dactech.requestoff.model.request.TeamRegistRequest;
import com.dactech.requestoff.model.request.TeamSearchRequest;
import com.dactech.requestoff.model.response.TeamDeleteResponse;
import com.dactech.requestoff.model.response.TeamDetailsResponse;
import com.dactech.requestoff.model.response.TeamEditInfoResponse;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.model.response.TeamSearchResponse;
import com.dactech.requestoff.service.TeamService;

@RestController
public class TeamController {
	@Autowired
	TeamService teamService;

	@RequestMapping(value = "/team/regist", method = RequestMethod.POST)
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

	@RequestMapping(value = "/team/search", method = RequestMethod.POST)
	public TeamSearchResponse teamSearch(@RequestBody TeamSearchRequest teamSearchRequest) {
		TeamSearchResponse response;
		try {
			response = teamService.teamSearch(teamSearchRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			response = new TeamSearchResponse();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}

		return response;
	}

	@RequestMapping(value = "/team/details", method = RequestMethod.POST)
	public TeamDetailsResponse teamDetails(@RequestBody TeamDetailsRequest teamDetailsRequest) {
		TeamDetailsResponse response = new TeamDetailsResponse();
		StatusInfo statusInfo = null;
		try {
			response = teamService.teamDetails(teamDetailsRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}
	
	@RequestMapping(value = "/team/editInfo", method = RequestMethod.POST)
	public TeamEditInfoResponse teamEditInfo(@RequestBody TeamEditInfoRequest request) {
		TeamEditInfoResponse response = new TeamEditInfoResponse();
		StatusInfo statusInfo = null;
		try {
			response = teamService.teamEditInfo(request);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}
	
	@RequestMapping(value = "/team/delete", method = RequestMethod.POST)
	public TeamDeleteResponse teamDelete(@RequestBody TeamDeleteRequest request) {
		TeamDeleteResponse response = new TeamDeleteResponse();
		StatusInfo statusInfo = null;
		try {
			boolean isSuccess = teamService.teamDelete(Long.parseLong(request.getTeamId()));
			if (isSuccess) {
				statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
			} else {
				statusInfo = new StatusInfo(StatusInfo.ERROR, "Cannot delete Team");
			}
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}
}
