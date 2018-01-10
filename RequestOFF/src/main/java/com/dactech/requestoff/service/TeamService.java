package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.TeamRegistRequest;
import com.dactech.requestoff.model.response.TeamRegistResponse;

public interface TeamService {
	TeamRegistResponse teamRegist(TeamRegistRequest teamRegistRequest);
}
