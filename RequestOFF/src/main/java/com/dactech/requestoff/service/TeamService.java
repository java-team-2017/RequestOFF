package com.dactech.requestoff.service;

import com.dactech.requestoff.model.request.TeamDetailsRequest;
import com.dactech.requestoff.model.request.TeamRegistRequest;
import com.dactech.requestoff.model.request.TeamSearchRequest;
import com.dactech.requestoff.model.response.TeamDetailsResponse;
import com.dactech.requestoff.model.response.TeamRegistResponse;
import com.dactech.requestoff.model.response.TeamSearchResponse;

public interface TeamService {
	TeamRegistResponse teamRegist(TeamRegistRequest teamRegistRequest) throws Exception;

	TeamSearchResponse teamSearch(TeamSearchRequest teamSearchRequest);

	TeamDetailsResponse teamDetails(TeamDetailsRequest teamDetailsRequest);
}
