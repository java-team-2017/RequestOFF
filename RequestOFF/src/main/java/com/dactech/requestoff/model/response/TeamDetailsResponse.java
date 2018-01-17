package com.dactech.requestoff.model.response;

import com.dactech.requestoff.model.entity.Team;

public class TeamDetailsResponse {
	private Team team;

	public TeamDetailsResponse() {
	}

	public TeamDetailsResponse(Team team) {
		this.team = team;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

}
