package com.dactech.requestoff.batch;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.CompanyYearOffSearchRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.repository.CompanyYearOffRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.service.CompanyYearOffService;

@Component
public class CompanyYearOffScheduler {
	@Autowired
	CompanyYearOffService companyYearOffService;
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;
	@Autowired
	EmployeeOffStatusRepository employeeOffStatusRepository;
	@Autowired
	RequestRepository requestRepository;
	
	@PostConstruct
	public void initialize() {
		System.out.println("do 1 time at first");
	}
	
//	@Scheduled(cron = "00 59 23 31 12 *") // excute every year end
	@Scheduled(cron = "00 23 14 23 3 *") // excute every year end
	public void reportCurrentTime() throws Exception {
		System.out.println("excute every year end");
		long currentYear, nextYear;
		currentYear = companyYearOffService.getCurrentYear();
		
		EmployeeOffStatusSearchRequest eosSearchRequest = new EmployeeOffStatusSearchRequest(Long.toString(currentYear), "", "", "", "1");
		List<EmployeeOffStatus> listEos = employeeOffStatusRepository.search(eosSearchRequest);
		
		CompanyYearOffSearchRequest cyoSearchRequest = new CompanyYearOffSearchRequest();
		cyoSearchRequest.setCurrentYearFlag(CompanyYearOff.NEXT_YEAR + "");
		List<CompanyYearOff> listCyo = companyYearOffRepository.search(cyoSearchRequest);
		
		CompanyYearOff cyo;
		if(listCyo != null && listCyo.size() > 0) {
			cyo = listCyo.get(0);
			nextYear = cyo.getId();
			cyo.setCurrentYearFlag(CompanyYearOff.CURRENT_YEAR);
			companyYearOffRepository.save(cyo);
		} else {
			cyo = new CompanyYearOff();
			nextYear = currentYear + 1;
			cyo.setId(nextYear);
			cyo.setDayOffResetFlag(CompanyYearOff.DEFAULT_DAY_OFF_RESET_FLAG);
			cyo.setNumberDayOff(CompanyYearOff.DEFAULT_NUMBER_DAY_OFF);
			cyo.setCurrentYearFlag(CompanyYearOff.CURRENT_YEAR);
			cyo.setValidFlag(1);
			
			companyYearOffRepository.save(cyo);
		}
		
		for(EmployeeOffStatus eos : listEos) {
			EmployeeOffStatus nextEos = employeeOffStatusRepository.findById(nextYear, eos.getEmployeeId());
			if(nextEos == null) {
				EmployeeOffStatus newEos = new EmployeeOffStatus();
				newEos.setYearId(cyo.getId());
				newEos.setEmployeeId(eos.getEmployeeId());
				
				//get approved requests of employee
				double totalNextYearOffHours = 0;
				RequestSearchRequest rsr = new RequestSearchRequest();
				rsr.setEmployeeId(eos.getEmployeeId() + "");
				rsr.setValidFlag("1");
				rsr.setStatus(Request.REQUEST_STATUS_APPROVED + "");
				rsr.setFromTime(nextYear + "-01-01 00:00:00");
				System.out.println(rsr.getFromTime() + "\n\n=================");
				List<Request> requests = requestRepository.searchRequest(rsr);
				
				//get approved requests of next year only
				List<Request> nextYearRequests = new ArrayList<Request>();
				for(Request r : requests) {
					if(Long.parseLong(r.getToTime().substring(0, 4)) == nextYear) {
						nextYearRequests.add(r);
					}
				}
				
				//calculate total off hours of next year
				for(Request r : nextYearRequests) {
					if(r.getDayOffType().getPaymentFlag() == DayOffType.PAYMENT_FLAG_PAYING) {
						totalNextYearOffHours += r.getTotalTime();
					}
				}
				System.out.println(eos.getEmployeeId() + "---" + totalNextYearOffHours + "-----");
				
				double totalHours;
				if(cyo.getDayOffResetFlag() == CompanyYearOff.DAY_OFF_RESET) {
					totalHours = cyo.getNumberDayOff() * 8 - totalNextYearOffHours;
				} else {
					totalHours = cyo.getNumberDayOff() * 8 + eos.getRemainHours() - totalNextYearOffHours;
				}
				newEos.setRemainHours(totalHours);
				newEos.setTotalHours(totalHours);
				newEos.setValidFlag(1);
				employeeOffStatusRepository.save(newEos);
			}
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
