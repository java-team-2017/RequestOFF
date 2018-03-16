package com.dactech.requestoff.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "/createRequest";
	}

	@GetMapping("/login")
	public String login() {
		return "/login";
	}

	@GetMapping("/403")
	public String error403() {
		return "/error/403";
	}

	@GetMapping("/header")
	public String layout() {
		return "fragments/header";
	}

	@GetMapping("/footer")
	public String footer() {
		return "fragments/footer";
	}
	
	@GetMapping("/menu")
	public String showMenu() {
		return "menu";
	}

	@GetMapping("/requestBrowsing")
	public String requestBrowsing() {
		return "/requestBrowsing";
	}

	@RequestMapping(value = "/statistic", method = RequestMethod.GET)
	public String statistic() {
		return "/statistic";
	}

	@GetMapping("/requestHistory")
	public String requestHistoryScreen() {
		return "requestHistory";
	}

	@GetMapping("/createRequest")
	public String createRequestScreen() {
		return "createRequest";
	}
	
	@GetMapping("/departmentManagement")
	public String departmentManagement() {
		return "/departmentManagement";
	}
	
	@GetMapping("/teamManagement")
	public String teamManagement() {
		return "/teamManagement";
	}
	
	@GetMapping("/employeeManagement")
	public String employeeManagement() {
		return "/employeeManagement";
	}
	
	@GetMapping("/slack")
	String slack() {
		return "slack";
	}
	
	@GetMapping("/companyYearOffManagement")
	public String companyYearOffManagement() {
		return "companyYearOffManagement";
	}
	
	@GetMapping("/changePassword")
	public String changePassword() {
		return "changePassword";
	}
	
	@GetMapping("/hrViewRequests")
	public String hrViewRequests() {
		return "hrViewRequests";
	}
	
}
