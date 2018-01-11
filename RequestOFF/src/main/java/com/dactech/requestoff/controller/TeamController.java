package com.dactech.requestoff.controller;

import java.io.Console;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.request.TeamRegistRequest;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.service.TeamService;

@RestController
public class TeamController {
	@Autowired
	TeamService teamService;
	
	@RequestMapping(value = "/team_regist")
	public TeamRegistResponse teamRegist(@RequestBody TeamRegistRequest teamRegistRequest) {
		return teamService.teamRegist(teamRegistRequest);
	}
}
