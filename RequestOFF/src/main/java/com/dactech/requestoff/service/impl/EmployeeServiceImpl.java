package com.dactech.requestoff.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.request.EmployeeDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatisticsRequest;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatisticsResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.service.EmployeeService;
import com.dactech.requestoff.util.DateProcessing;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeRepository employeeRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public EmployeeRegistResponse employeeRegist(EmployeeRegistRequest employeeRegistRequest) throws Exception {

		Position position = new Position();
		position.setId(employeeRegistRequest.getPositionId());

		Employee employee = employeeRepository.findById(employeeRegistRequest.getId());
		if (employee == null) { // insert new Employee
			employee = new Employee();
		} else if (!employee.getUpdateDate().equals(employeeRegistRequest.getUpdateDate())) { // update case, check update date
			throw new Exception("Someone updated Employee with id " + employeeRegistRequest.getId() + " at "
					+ employee.getUpdateDate());
		}

		employee.setValidFlag(employeeRegistRequest.getValidFlag());
		employee.setName(employeeRegistRequest.getName());
		employee.setGender(employeeRegistRequest.getGender());
		employee.setBirthday(employeeRegistRequest.getBirthday());
		employee.setPosition(position);
		employee.setEmail(employeeRegistRequest.getEmail());
		employee.setPassword(bCryptPasswordEncoder.encode(employeeRegistRequest.getPassword()));
		employee.setPhone(employeeRegistRequest.getPhone());
		employee.setStartWorkingDate(employeeRegistRequest.getStartWorkingDate());
		employee.setOfficialWorkingDate(employeeRegistRequest.getOfficialWorkingDate());

		employeeRepository.save(employee);
		return new EmployeeRegistResponse(employee.getId());
	}

	@Override
	public EmployeeSearchResponse employeeSearch(EmployeeSearchRequest employeeSearchRequest) {
		List<Employee> listEmployee = employeeRepository.search(employeeSearchRequest);
		EmployeeSearchResponse response = new EmployeeSearchResponse();
		response.setEmployees(listEmployee);
		return response;
	}

	@Override
	public EmployeeDetailsResponse employeeDetails(EmployeeDetailsRequest employeeDetailsRequest) {
		Employee employee = employeeRepository.findById(employeeDetailsRequest.getId());
		EmployeeDetailsResponse response = new EmployeeDetailsResponse(employee);
		return response;
	}

	@Override
	public EmployeeOffStatisticsResponse employeeOffStatistics(
			EmployeeOffStatisticsRequest eosRequest) throws Exception{
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		String requestFromTimeStr = eosRequest.getFromTime().equals("") ? "2000-01-01T01:00" : eosRequest.getFromTime();
		Date requestFromTime = formatter.parse(requestFromTimeStr);
		Date requestToTime;
		if (eosRequest.getToTime().equals("")) {
			requestToTime = Calendar.getInstance().getTime();
		} else {
			requestToTime = formatter.parse(eosRequest.getToTime());
		}
		
		// get list employee from database with name, team and department
		List<Employee> listEmployee = employeeRepository.search(eosRequest.getEmployee(), eosRequest.getTeamId(), eosRequest.getDepartmentId());
		
		// create list statistics correspond to each employee
		List<EmployeeOffStatisticsResponse.EmployeeStatistics> lEStatistics = new ArrayList<EmployeeOffStatisticsResponse.EmployeeStatistics>(listEmployee.size());
		for (Employee employee : listEmployee) {
			EmployeeOffStatisticsResponse.EmployeeStatistics eStatistics = new EmployeeOffStatisticsResponse.EmployeeStatistics();
			eStatistics.setEmployee(employee);
			
			// classify request according to payment_flag
			// calculate total off time of each class
			List<Request> listRequest = employee.getListRequest();
			List<Request> listRequestWithPaying = new ArrayList<Request>(listRequest.size());
			List<Request> listRequestWithoutPaying = new ArrayList<Request>(listRequest.size());
			long timeOffWithPaying = 0;
			long timeOffWithoutPaying = 0;
			
			formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			for(Request request : listRequest) {
				// eliminate Request entity with status != approved and valid_flag == 0
				if (request.getStatus() != Request.REQUEST_STATUS_APPROVED ||
						request.getValidFlag() == 0) {
					continue;
				}

				// eliminate Request entity with time unmatch the time of statisticRequest
				Date fromTime = formatter.parse(request.getFromTime());
				Date toTime = formatter.parse(request.getToTime());
				if (fromTime.after(requestToTime) || toTime.before(requestFromTime)) {
					continue;
				}
				
				// get the offTime within StatisticsRequestTime
				// (the range of Request off time may be over the range of StatisticsRequestTime)
				Date startTime = fromTime.after(requestFromTime) ? fromTime : requestFromTime;
				Date endTime = toTime.before(requestToTime) ? toTime : requestToTime;
				
				// calculate amount of off time in working time
				long timeOff = DateProcessing.diffHours(startTime, endTime);
				
				if (request.getDayOffType().getPaymentFlag() == DayOffType.PAYMENT_FLAG_PAYING) {
					timeOffWithPaying += timeOff;
					listRequestWithPaying.add(request);
				} else {
					timeOffWithoutPaying += timeOff;
					listRequestWithoutPaying.add(request);
				}
			}
			
			eStatistics.setListRequestWithoutPaying(listRequestWithoutPaying);
			eStatistics.setListRequestWithPaying(listRequestWithPaying);
			eStatistics.setTimeOffWithoutPaying(timeOffWithoutPaying);
			eStatistics.setTimeOffWithPaying(timeOffWithPaying);
			
			lEStatistics.add(eStatistics);
		}
		
		return new EmployeeOffStatisticsResponse(lEStatistics);
	}
}
