package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Request;

public interface RequestRepository extends JpaRepository<Request, Long>{

}
