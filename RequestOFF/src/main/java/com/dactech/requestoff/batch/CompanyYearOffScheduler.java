package com.dactech.requestoff.batch;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.repository.CompanyYearOffRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.service.CompanyYearOffService;

@Component
public class CompanyYearOffSetting {
	@Autowired
	CompanyYearOffService companyYearOffService;
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;
	@Autowired
	EmployeeOffStatusRepository employeeOffStatusRepository;
	
	@PostConstruct
	public void initialize() {
		System.out.println("do 1 time at first");
	}
	
	@Scheduled(cron = "00 59 23 31 12 *") // excute every year end
	public void reportCurrentTime() throws Exception {
		System.out.println("excute every year end");
		long currentYear, nextYear;
		currentYear = companyYearOffService.getCurrentYear();
		nextYear = currentYear + 1;
		
		EmployeeOffStatusSearchRequest eosSearchRequest = new EmployeeOffStatusSearchRequest(Long.toString(currentYear), "", "", "", "1");
		List<EmployeeOffStatus> listEos = employeeOffStatusRepository.search(eosSearchRequest);
		
		CompanyYearOffSearchRequest cyoSearchRequest = new CompanyYearOffSearchRequest();
		cyoSearchRequest.setCurrentYearFlag(CompanyYearOff.NEXT_YEAR + "");
		List<CompanyYearOff> listCyo = companyYearOffRepository.search(cyoSearchRequest);
		
		CompanyYearOff cyo;
		if(listCyo != null && listCyo.size() > 0) {
			cyo = listCyo.get(0);
			cyo.setCurrentYearFlag(CompanyYearOff.CURRENT_YEAR);
			companyYearOffRepository.save(cyo);
		} else {
			cyo = new CompanyYearOff();
			cyo.setId(nextYear);
			cyo.setDayOffResetFlag(CompanyYearOff.DEFAULT_DAY_OFF_RESET_FLAG);
			cyo.setNumberDayOff(CompanyYearOff.DEFAULT_NUMBER_DAY_OFF);
			cyo.setCurrentYearFlag(CompanyYearOff.CURRENT_YEAR);
			cyo.setValidFlag(1);
			
			companyYearOffRepository.save(cyo);
		}
		
		for(EmployeeOffStatus eos : listEos) {
			EmployeeOffStatus newEos = new EmployeeOffStatus();
			newEos.setYearId(cyo.getId());
			newEos.setEmployeeId(eos.getEmployeeId());
			
			double totalHours;
			if(cyo.getDayOffResetFlag() == CompanyYearOff.DAY_OFF_RESET) {
				totalHours = cyo.getNumberDayOff() * 8;
			} else {
				totalHours = cyo.getNumberDayOff() * 8 + eos.getRemainHours();
			}
			newEos.setRemainHours(totalHours);
			newEos.setTotalHours(totalHours);
			newEos.setValidFlag(1);
			employeeOffStatusRepository.save(newEos);
		}
		
		cyoSearchRequest.setCurrentYearFlag(CompanyYearOff.LAST_YEAR + "");
		List<CompanyYearOff> listLastCyo = companyYearOffRepository.search(cyoSearchRequest);
		if(listLastCyo != null && listLastCyo.size() > 0) {
			CompanyYearOff lastCyo = listLastCyo.get(0);
			lastCyo.setCurrentYearFlag(CompanyYearOff.OLD_YEAR);
			companyYearOffRepository.save(lastCyo);
		} else {
			throw new Exception("Can not find company year off of last year");
		}
		
		CompanyYearOff currentCompanyYearOff = companyYearOffRepository.findById(currentYear);
		currentCompanyYearOff.setCurrentYearFlag(CompanyYearOff.LAST_YEAR);
		companyYearOffRepository.save(currentCompanyYearOff);
	}
}
