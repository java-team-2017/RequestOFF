package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.repository.custom.RequestRepositoryCustom;

public interface RequestRepository extends JpaRepository<Request, Long>, RequestRepositoryCustom{
	public Request findById(long id);
}
