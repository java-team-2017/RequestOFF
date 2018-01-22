package com.dactech.requestoff.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.request.EmployeeDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeRepository employeeRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public EmployeeRegistResponse employeeRegist(EmployeeRegistRequest employeeRegistRequest) {

		Position position = new Position();
		position.setId(employeeRegistRequest.getPositionId());

		Employee employee = employeeRepository.findById(employeeRegistRequest.getId());
		if (employee == null) { // insert new Employee
			employee = new Employee();
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

}
