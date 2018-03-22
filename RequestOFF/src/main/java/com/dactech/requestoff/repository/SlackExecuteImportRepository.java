package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.SlackExecuteImport;

public interface SlackExecuteImportRepository extends JpaRepository<SlackExecuteImport, Long> {
	
}
