package com.dactech.requestoff.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.TeamEmployee;

public interface TeamEmployeeRepository extends JpaRepository<TeamEmployee, Long>{
	TeamEmployee findByEmployeeId(long employeeId);
	List<TeamEmployee> findByTeamId(long teamId);
	TeamEmployee findByTeamIdAndEmployeeId(long teamId, long employeeId);
}
