package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.repository.custom.PositionRepositoryCustom;

public interface PositionRepository extends JpaRepository<Position, Long>, PositionRepositoryCustom{
	public Position findById(long id);
}
