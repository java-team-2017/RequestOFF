package com.dactech.requestoff.batch;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.service.EmployeeService;
import com.dactech.requestoff.service.SlackRequestService;

@Component
public class SlackBirthdayMessage {
	@Autowired
	SlackRequestService slackRequestService;
	@Autowired
	EmployeeService employeeService;

	@PostConstruct
	public void initialize() {
	}
	
	@Scheduled(cron = "0 0 8 * * *") //chay vao 8h moi ngay
	public void getBirthdayOfEmployee() throws Exception {
		List<Employee> listEmployeeHaveBirthday = employeeService.getListBirthdayOfEmployee();
		if(listEmployeeHaveBirthday.size() != 0) {
			for(Employee employee : listEmployeeHaveBirthday) {
				slackRequestService.sendBirthdayMsgToEmployee(employee);
			}
		}
	}
}
