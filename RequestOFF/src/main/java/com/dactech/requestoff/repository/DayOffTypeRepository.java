package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.repository.custom.DayOffTypeRepositoryCustom;

public interface DayOffTypeRepository extends JpaRepository<DayOffType, Long>, DayOffTypeRepositoryCustom{
	
	public DayOffType findById(long id);
}
