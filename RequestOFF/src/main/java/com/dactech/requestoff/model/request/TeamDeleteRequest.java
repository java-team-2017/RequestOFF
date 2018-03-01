package com.dactech.requestoff.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TeamDeleteRequest {
	@JsonProperty("team_id")
	private String teamId;

	public TeamDeleteRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TeamDeleteRequest(String teamId) {
		super();
		this.teamId = teamId;
	}

	public String getTeamId() {
		return teamId;
	}

	public void setTeamId(String teamId) {
		this.teamId = teamId;
	}

}
