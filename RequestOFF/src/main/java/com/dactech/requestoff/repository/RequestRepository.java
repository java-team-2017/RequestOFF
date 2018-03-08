package com.dactech.requestoff.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.repository.custom.RequestRepositoryCustom;

public interface RequestRepository extends JpaRepository<Request, Long>, RequestRepositoryCustom{
	public Request findById(long id);
	
	@Query(value = "SELECT * FROM request WHERE employee_id = ?1 AND ( from_time BETWEEN ?2 AND ?3 ) "
			+ "AND status = 2 " // approved
			+ "AND valid_flag = 1", nativeQuery = true)
	public List<Request> findByEmpoyeeIdAndTime(long empoyeeId, String from, String to);
}
