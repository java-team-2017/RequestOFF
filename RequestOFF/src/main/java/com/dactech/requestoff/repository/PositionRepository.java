package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.Position;

public interface PositionRepository extends JpaRepository<Position, Long>{

}
