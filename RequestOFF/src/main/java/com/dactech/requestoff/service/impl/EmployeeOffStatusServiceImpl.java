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
import com.dactech.requestoff.util.StringUtil;

@Service
public class EmployeeOffStatusServiceImpl implements EmployeeOffStatusService {
	@Autowired
	EmployeeOffStatusRepository employeeOffStatusRepository;
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	CompanyYearOffRepository companyYearOffRepository;

	@Override
	public EmployeeOffStatusRegistResponse employeeOffStatusRegist(EmployeeOffStatusRegistRequest eOSRRequest)
			throws Exception {
		long yearId = Long.parseLong(eOSRRequest.getYearId());
		long employeeId = Long.parseLong(eOSRRequest.getEmployeeId());

		EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository.findById(yearId, employeeId);
		if (employeeOffStatus == null) { // create new
			employeeOffStatus = new EmployeeOffStatus();

			CompanyYearOff companyYearOff = companyYearOffRepository.findById(yearId);
			employeeOffStatus.setCompanyYearOff(companyYearOff);

			Employee employee = employeeRepository.findById(employeeId);
			employeeOffStatus.setEmployee(employee);

			employeeOffStatus.setRemainHours(Long.parseLong(eOSRRequest.getRemainHours()));
			employeeOffStatus.setTotalHours(Long.parseLong(eOSRRequest.getTotalHours()));
			employeeOffStatus.setValidFlag(Integer.parseInt(eOSRRequest.getValidFlag()));

		} else { // update
			if (!employeeOffStatus.getUpdateDate().equals(eOSRRequest.getUpdateDate())) {
				throw new Exception("Someone updated EmployeeOffStatus with year id "
						+ employeeOffStatus.getCompanyYearOff().getId() + " and employee id "
						+ employeeOffStatus.getEmployee().getId() + " at " + employeeOffStatus.getUpdateDate());
			}

			if (StringUtil.isNotEmpty(eOSRRequest.getRemainHours())) {
				employeeOffStatus.setRemainHours(Long.parseLong(eOSRRequest.getRemainHours()));
			}
			if (StringUtil.isNotEmpty(eOSRRequest.getTotalHours())) {
				employeeOffStatus.setTotalHours(Long.parseLong(eOSRRequest.getTotalHours()));
			}
			if (StringUtil.isNotEmpty(eOSRRequest.getValidFlag())) {
				employeeOffStatus.setValidFlag(Integer.parseInt(eOSRRequest.getValidFlag()));
			}
		}

		employeeOffStatusRepository.save(employeeOffStatus);

		return new EmployeeOffStatusRegistResponse(employeeOffStatus.getCompanyYearOff().getId(),
				employeeOffStatus.getEmployee().getId());
	}

	@Override
	public EmployeeOffStatusDetailsResponse details(EmployeeOffStatusDetailsRequest employeeOffStatusDetailsRequest) {
		EmployeeOffStatus employeeOffStatus = employeeOffStatusRepository
				.findById(employeeOffStatusDetailsRequest.getYearId(), employeeOffStatusDetailsRequest.getEmployeeId());
		EmployeeOffStatusDetailsResponse employeeOffStatusDetailsResponse = new EmployeeOffStatusDetailsResponse(
				employeeOffStatus);
		return employeeOffStatusDetailsResponse;
	}

	@Override
	public EmployeeOffStatusSearchResponse search(EmployeeOffStatusSearchRequest employeeOffStatusSearchRequest) {
		List<EmployeeOffStatus> listEmployeeOffStatus = employeeOffStatusRepository
				.search(employeeOffStatusSearchRequest);
		EmployeeOffStatusSearchResponse response = new EmployeeOffStatusSearchResponse();
		response.setListEmployeeOffStatus(listEmployeeOffStatus);
		return response;
	}
}
