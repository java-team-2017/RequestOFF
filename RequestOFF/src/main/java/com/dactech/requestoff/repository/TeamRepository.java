package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.repository.custom.TeamRepositoryCustom;

public interface TeamRepository extends JpaRepository<Team, Long>, TeamRepositoryCustom{
	public Team findById(long id);
	public Team findByLeaderId(long leaderId);
}
