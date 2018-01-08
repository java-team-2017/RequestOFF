package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.DayOffType;

public interface DayOffTypeRepository extends JpaRepository<DayOffType, Long> {

}
