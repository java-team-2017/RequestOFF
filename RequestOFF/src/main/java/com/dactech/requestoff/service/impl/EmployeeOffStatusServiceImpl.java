package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.CompanyYearOff;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.request.EmployeeOffStatusDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusRegistRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.model.response.EmployeeOffStatusDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatusRegistResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatusSearchResponse;
import com.dactech.requestoff.repository.CompanyYearOffRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.service.EmployeeOffStatusService;

@Service
public class EmployeeOffStatusServiceImpl implements EmployeeOffStatusService {
	@Autowired
	EmployeeOffStatusRepository employeeOffStatusRepository;
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;

	@Override
	public EmployeeOffStatusRegistResponse employeeOffStatusRegist(EmployeeOffStatusRegistRequest eOSRRequest) throws Exception {
		EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.findById(eOSRRequest.getYearId(),
				eOSRRequest.getEmployeeId());
		if (employeeOffStatus == null) {
			employeeOffStatus = new EmployeeOffStatus();
			CompanyYearOff companyYearOff = companyYearOffRepository.findById(eOSRRequest.getYearId());
			Employee employee = employeeRepository.findById(eOSRRequest.getEmployeeId());
			employeeOffStatus.setEmployee(employee);
			employeeOffStatus.setCompanyYearOff(companyYearOff);
		} else if (!employeeOffStatus.getUpdateDate().equals(eOSRRequest.getUpdateDate())) { // update case, check update date
			throw new Exception("Someone updated EmployeeOffStatus at "
					+ employeeOffStatus.getUpdateDate());
		}

		employeeOffStatus.setRemainHours(eOSRRequest.getRemainHours());
		employeeOffStatus.setTotalHours(eOSRRequest.getTotalHours());
		employeeOffStatus.setValidFlag(eOSRRequest.getValidFlag());

		employeeOffStatusRepository.save(employeeOffStatus);

		return new EmployeeOffStatusRegistResponse(employeeOffStatus.getCompanyYearOff().getId(),
				employeeOffStatus.getEmployee().getId());
	}
	
	@Override
	public EmployeeOffStatusDetailsResponse details(EmployeeOffStatusDetailsRequest employeeOffStatusDetailsRequest) {
		EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.details(employeeOffStatusDetailsRequest);
		EmployeeOffStatusDetailsResponse employeeOffStatusDetailsResponse = new EmployeeOffStatusDetailsResponse(employeeOffStatus);
		return employeeOffStatusDetailsResponse;
	}

	@Override
	public EmployeeOffStatusSearchResponse search(EmployeeOffStatusSearchRequest employeeOffStatusSearchRequest) {
		List<EmployeeOffStatus> listEmployeeOffStatus = employeeOffStatusRepository.search(employeeOffStatusSearchRequest);
		EmployeeOffStatusSearchResponse response = new EmployeeOffStatusSearchResponse();
		response.setListEmployeeOffStatus(listEmployeeOffStatus);
		return response;
	}
}
