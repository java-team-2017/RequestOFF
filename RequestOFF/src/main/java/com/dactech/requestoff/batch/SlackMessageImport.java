package com.dactech.requestoff.batch;

import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.service.EmployeeService;
import com.dactech.requestoff.service.SlackRequestService;

@Component
public class SlackMessageImport {
	private static final String token = "xoxp-282152434071-281131491028-310284848339-c85d05498c88a7c78116a1517454f1ba";
	private static final String channel = "C94BSF83C";

	private Date lastTime;

	@Autowired
	SlackRequestService slackRequestService;
	@Autowired
	EmployeeService employeeService;

	@PostConstruct
	public void initialize() {
		lastTime = new Date();
	}
	
	@Scheduled(cron = "0 0 8 * * *") //chay vao 8h moi ngay
	public void getBirthdayOfEmployee() throws Exception {
		List<Employee> listEmployeeHaveBirthday = employeeService.listEmployeeHaveBirthday();
		if(listEmployeeHaveBirthday.size() != 0) {
			for(Employee employee : listEmployeeHaveBirthday) {
				slackRequestService.sendBirthdayMsgToEmployee(employee);
			}
		}
	}
//	@Scheduled(cron = "* * 23 * * *") // chay vao 23h moi ngay
	@Scheduled(cron = "*/5 * * * * *") // cach 5 giay chay 1 lan
	public void reportCurrentTime() {
		Date oldest = lastTime;
		Date latest = new Date();
		try {
			long numOfSlackRequests = slackRequestService.importSlackRequest(token, channel, latest, oldest);
			System.out.println("import " + numOfSlackRequests + " request from slack");
			lastTime = latest;
		} catch (Exception e) {
			lastTime = oldest;
			e.printStackTrace();
		}
	}

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}
}
