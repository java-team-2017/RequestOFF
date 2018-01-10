package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Team;

public interface TeamRepository extends JpaRepository<Team, Long>{
	public Team findById(long id);
}
