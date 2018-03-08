package com.dactech.requestoff.repository.custom;

import java.util.List;

import com.dactech.requestoff.model.entity.SlackRequest;
import com.dactech.requestoff.model.request.SlackRequestSearchRequest;

public interface SlackRequestRepositoryCustom {
	List<SlackRequest> search(SlackRequestSearchRequest request);
}
