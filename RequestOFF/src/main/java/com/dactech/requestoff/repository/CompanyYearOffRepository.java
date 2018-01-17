package com.dactech.requestoff.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.repository.custom.CompanyYearOffRepositoryCustom;

public interface CompanyYearOffRepository extends JpaRepository<CompanyYearOff, Long>, CompanyYearOffRepositoryCustom{
	public CompanyYearOff findById(long id);
}
