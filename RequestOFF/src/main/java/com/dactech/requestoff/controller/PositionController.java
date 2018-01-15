package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.request.PositionRegistRequest;
import com.dactech.requestoff.model.response.PositionRegistResponse;
import com.dactech.requestoff.service.PositionService;

@RestController
public class PositionController {
	@Autowired
	PositionService positionService;
	
	@RequestMapping(value = "/position/regist", method = RequestMethod.POST)
	public PositionRegistResponse insert(@RequestBody PositionRegistRequest positionRegistRequest) {
		PositionRegistResponse positionRegistResponse = positionService.registPosition(positionRegistRequest);
		return positionRegistResponse;
	}
}
