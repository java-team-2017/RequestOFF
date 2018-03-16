package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.CompanyYearOffCurrentAndNextYearSearchRequest;
import com.dactech.requestoff.model.request.CompanyYearOffDetailsRequest;
import com.dactech.requestoff.model.request.CompanyYearOffRegistRequest;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.model.response.CompanyYearOffCurrentAndNextYearSearchResponse;
import com.dactech.requestoff.model.response.CompanyYearOffDetailsResponse;
import com.dactech.requestoff.model.response.CompanyYearOffRegistResponse;
import com.dactech.requestoff.model.response.CompanyYearOffSearchResponse;
import com.dactech.requestoff.repository.CompanyYearOffRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.service.CompanyYearOffService;
import com.dactech.requestoff.service.EmployeeOffStatusService;
import com.dactech.requestoff.util.StringUtil;

@Service
public class CompanyYearOffServiceImpl implements CompanyYearOffService{
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;
	@Autowired
	EmployeeOffStatusRepository employeeOffStatusRepository;
	@Autowired
	EmployeeOffStatusService employeeOffStatusService;
	
	@Override
	public CompanyYearOffRegistResponse regist(CompanyYearOffRegistRequest companyYearOffRegistRequest) throws Exception{
		CompanyYearOff companyYearOff;
		
		if(StringUtil.isEmpty(companyYearOffRegistRequest.getForNextYear())) {
			throw new Exception("Can not regist company year off without knowing which year to set for");
		}
		else {
			if(companyYearOffRegistRequest.getForNextYear().equals("1")) { // create new company year off
				long currentYear, nextYear, lastYear;
				currentYear = getCurrentYear();
				nextYear = currentYear + 1;
//				lastYear = currentYear - 1;
//				
//				CompanyYearOff currentCompanyYearOff = companyYearOffRepository.findById(nextYear);
//				currentCompanyYearOff.setCurrentYearFlag(CompanyYearOff.NEXT_YEAR);
//				companyYearOffRepository.save(currentCompanyYearOff);
//				
//				CompanyYearOff lastCompanyYearOff = companyYearOffRepository.findById(lastYear);
//				lastCompanyYearOff.setCurrentYearFlag(CompanyYearOff.OLD_YEAR);
//				companyYearOffRepository.save(lastCompanyYearOff);
					
				companyYearOff = new CompanyYearOff();
				companyYearOff.setId(nextYear);
				companyYearOff.setDayOffResetFlag(Integer.parseInt(companyYearOffRegistRequest.getDayOffResetFlag()));
				companyYearOff.setNumberDayOff(Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()));
				companyYearOff.setCurrentYearFlag(CompanyYearOff.NEXT_YEAR);
				companyYearOff.setValidFlag(1);
				
				companyYearOffRepository.save(companyYearOff);
					
//				EmployeeOffStatusSearchRequest eosSearchRequest = new EmployeeOffStatusSearchRequest(Long.toString(currentYear), "", "", "", "");
//				List<EmployeeOffStatus> listEos = employeeOffStatusRepository.search(eosSearchRequest);
//				for(EmployeeOffStatus eos : listEos) {
//					EmployeeOffStatus newEos = new EmployeeOffStatus();
//					newEos.setYearId(nextYear);
//					newEos.setEmployeeId(eos.getEmployeeId());
//					
//					double remainHours;
//					if(companyYearOffRegistRequest.getDayOffResetFlag().equals("1")) {
//						remainHours = Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()) * 8;
//					} else {
//						remainHours = Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()) * 8 + eos.getRemainHours();
//					}
//					newEos.setRemainHours(remainHours);
//					newEos.setTotalHours(remainHours);
//					newEos.setValidFlag(1);
//					employeeOffStatusRepository.save(newEos);
//				}
			} else {	//update current year
				long currentYear;
				currentYear = getCurrentYear();
				
				companyYearOff = companyYearOffRepository.findById(currentYear);
				if(StringUtil.isNotEmpty(companyYearOffRegistRequest.getDayOffResetFlag())) {
					companyYearOff.setDayOffResetFlag(Integer.parseInt(companyYearOffRegistRequest.getDayOffResetFlag()));
				}
				if(StringUtil.isNotEmpty(companyYearOffRegistRequest.getNumberDayOff())) {
					companyYearOff.setNumberDayOff(Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()));
				}
				if(StringUtil.isNotEmpty(companyYearOffRegistRequest.getValidFlag())) {
					companyYearOff.setValidFlag(Integer.parseInt(companyYearOffRegistRequest.getValidFlag()));
				}
				companyYearOffRepository.save(companyYearOff);
				
				EmployeeOffStatusSearchRequest eosSearchRequest = new EmployeeOffStatusSearchRequest(currentYear + "", "", "", "", "");
				List<EmployeeOffStatus> listEos = employeeOffStatusRepository.search(eosSearchRequest);
				for(EmployeeOffStatus eos : listEos) {
					double remainHours, totalHours, offHours;
					offHours = eos.getTotalHours() - eos.getRemainHours();
					if(companyYearOffRegistRequest.getDayOffResetFlag().equals("1")) {
						remainHours = Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()) * 8 - offHours;
						totalHours = Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()) * 8;
					} else {
						CompanyYearOffSearchRequest cyoSearchRequest = new CompanyYearOffSearchRequest();
						cyoSearchRequest.setCurrentYearFlag("2");
						List<CompanyYearOff> listCompanyYearOff = companyYearOffRepository.search(cyoSearchRequest);
						if(listCompanyYearOff != null && listCompanyYearOff.size() > 0) {
							long lastYear = listCompanyYearOff.get(0).getId();
							eosSearchRequest = new EmployeeOffStatusSearchRequest(lastYear + "", eos.getEmployeeId() + "", "", "", "");
							List<EmployeeOffStatus> listLastEos = employeeOffStatusRepository.search(eosSearchRequest);
							if(listLastEos != null && listLastEos.size() > 0) {
								remainHours = listLastEos.get(0).getRemainHours()
												+ Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()) * 8 - offHours;
								totalHours = listLastEos.get(0).getRemainHours()
												+ Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()) * 8;
							} else {
								remainHours = Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()) * 8 - offHours;
								totalHours = Integer.parseInt(companyYearOffRegistRequest.getNumberDayOff()) * 8;
							}
						} else {
							throw new Exception("Can not find company year off of last year");
						}
					}
					eos.setRemainHours(remainHours);
					eos.setTotalHours(totalHours);
					eos.setValidFlag(1);
					employeeOffStatusRepository.save(eos);
				}
			}
		}
		
		CompanyYearOffRegistResponse companyYearOffRegistResponse = new CompanyYearOffRegistResponse();
		companyYearOffRegistResponse.setId(companyYearOff.getId());
		return companyYearOffRegistResponse;
	}
	
	@Override
	public CompanyYearOffSearchResponse search(CompanyYearOffSearchRequest companyYearOffSearchRequest) {
		List<CompanyYearOff> listCompanyYearOff = companyYearOffRepository.search(companyYearOffSearchRequest);
		CompanyYearOffSearchResponse companyYearOffSearchResponse = new CompanyYearOffSearchResponse(listCompanyYearOff);
		return companyYearOffSearchResponse;
	}
	
	@Override
	public CompanyYearOffDetailsResponse details(CompanyYearOffDetailsRequest companyYearOffDetailsRequest) {
		CompanyYearOff companyYearOff = companyYearOffRepository.findById(Long.parseLong(companyYearOffDetailsRequest.getId()));
		CompanyYearOffDetailsResponse companyYearOffDetailsResponse = new CompanyYearOffDetailsResponse(companyYearOff);
		return companyYearOffDetailsResponse;
	}
	
	@Override
	public long getCurrentYear() {
		CompanyYearOffSearchRequest cyoSearchRequest = new CompanyYearOffSearchRequest();
		cyoSearchRequest.setCurrentYearFlag("1");
		CompanyYearOffSearchResponse cyoSearchResponse = search(cyoSearchRequest);
		return cyoSearchResponse.getListCompanyYearOff().get(0).getId();
	}

	@Override
	public CompanyYearOffCurrentAndNextYearSearchResponse search(
			CompanyYearOffCurrentAndNextYearSearchRequest companyYearOffCurrentAndNextYearSearchRequest) {
		List<CompanyYearOff> listCompanyYearOff = companyYearOffRepository.getCompanyYearOffOfCurrentYearAndNextYear(companyYearOffCurrentAndNextYearSearchRequest);
		CompanyYearOffCurrentAndNextYearSearchResponse response = new CompanyYearOffCurrentAndNextYearSearchResponse(listCompanyYearOff);
		return response;
	}
}
