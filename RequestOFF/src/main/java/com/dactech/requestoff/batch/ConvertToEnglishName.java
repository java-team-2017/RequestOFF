package com.dactech.requestoff.batch;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.util.StringUtil;

@Component
public class ConvertToEnglishName {
	@Autowired
	private EmployeeRepository employeeRepository;
	
	@PostConstruct
	public void initialize() {
	}
	
	@Scheduled(cron = "0 59 16 10 4 *")
	public void convertToEngName() throws Exception {
		System.out.println("\n\n\n\n----------Convert to English name-----------\n\n\n\n");
		
		List<Employee> allEmployees = employeeRepository.getAllEmployees();
		for(Employee e : allEmployees) {
			System.out.println(e.getName());
			System.out.println(e.getEnglishName());
			if(e.getEnglishName() == null || e.getEnglishName() == "") {
				String engName = StringUtil.convertToEnglishName(e.getName());
				e.setEnglishName(engName);
				employeeRepository.save(e);
//				System.out.println("rong");
			}
		}
	}
}
