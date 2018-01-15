package com.dactech.requestoff.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeRepository employeeRepository;

	@Override
	public EmployeeRegistResponse employeeRegist(EmployeeRegistRequest employeeRegistRequest) {
		Employee employee;
		Position position = new Position();
		position.setId(employeeRegistRequest.getPositionId());

		if (employeeRegistRequest.getId() == 0) { // insert new Employee
			employee = new Employee();
			employee.setValidFlag(1);
		} else { // update Employee
			employee = employeeRepository.findById(employeeRegistRequest.getId());
		}
		
		employee.setName(employeeRegistRequest.getName());
		employee.setGender(employeeRegistRequest.getGender());
		employee.setBirthday(employeeRegistRequest.getBirthday());
		employee.setPosition(position);
		employee.setEmail(employeeRegistRequest.getEmail());
		employee.setPhone(employeeRegistRequest.getPhone());
		employee.setStartWorkingDate(employeeRegistRequest.getStartWorkingDate());
		employee.setOfficialWorkingDate(employeeRegistRequest.getOfficialWorkingDate());
		
		employeeRepository.save(employee);
		return new EmployeeRegistResponse(employee.getId());
	}

}
