package com.dactech.requestoff.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DefaultController {
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "/index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/login";
	}
	
	@GetMapping("/403")
	public String error403() {
		return "/error/403";
	}
	
	@RequestMapping(value = "/bootstrap", method = RequestMethod.GET)
	public String bootstrap() {
		return "/bootstrap";
	}
	
	@RequestMapping(value = "/statistic", method = RequestMethod.GET)
	public String statistic() {
		return "/statistic";
	}
}
