package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.SlackRequest;
import com.dactech.requestoff.repository.custom.SlackRequestRepositoryCustom;

public interface SlackRequestRepository extends JpaRepository<SlackRequest, Long>, SlackRequestRepositoryCustom{
	SlackRequest findById(long id);
}
