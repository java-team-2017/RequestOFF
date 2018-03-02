package com.dactech.requestoff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.request.DepartmentDeleteRequest;
import com.dactech.requestoff.model.request.DepartmentDetailsRequest;
import com.dactech.requestoff.model.request.DepartmentInfoRequest;
import com.dactech.requestoff.model.request.DepartmentRegistRequest;
import com.dactech.requestoff.model.request.DepartmentSearchRequest;
import com.dactech.requestoff.model.response.DepartmentDeleteResponse;
import com.dactech.requestoff.model.response.DepartmentDetailsResponse;
import com.dactech.requestoff.model.response.DepartmentInfoResponse;
import com.dactech.requestoff.model.response.DepartmentRegistResponse;
import com.dactech.requestoff.model.response.DepartmentSearchResponse;
import com.dactech.requestoff.service.DepartmentService;

@RestController
public class DepartmentController {
	@Autowired
	DepartmentService departmentService;
	
	@RequestMapping(value = "/department/regist", method = RequestMethod.POST)
	public DepartmentRegistResponse registDepartment(@RequestBody DepartmentRegistRequest departmentRegistRequest) {
		DepartmentRegistResponse departmentRegistResponse = new DepartmentRegistResponse();
		StatusInfo statusInfo = null;
		try {
			departmentRegistResponse = departmentService.registDepartment(departmentRegistRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		departmentRegistResponse.setStatusInfo(statusInfo);
		return departmentRegistResponse;
	}
	
	@RequestMapping(value = "/department/search", method = RequestMethod.POST)
	public DepartmentSearchResponse searchDepartment(@RequestBody DepartmentSearchRequest departmentSearchRequest) {
		DepartmentSearchResponse departmentSearchResponse = new DepartmentSearchResponse();
		StatusInfo statusInfo = null;
		try {
			departmentSearchResponse = departmentService.search(departmentSearchRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		departmentSearchResponse.setStatusInfo(statusInfo);
		
		return departmentSearchResponse;
	}
	
	@RequestMapping(value = "/department/details", method = RequestMethod.POST)
	public DepartmentDetailsResponse details(@RequestBody DepartmentDetailsRequest departmentDetailsRequest) {
		DepartmentDetailsResponse departmentDetailsResponse = new DepartmentDetailsResponse();
		StatusInfo statusInfo = null;
		try {
			departmentDetailsResponse = departmentService.details(departmentDetailsRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		departmentDetailsResponse.setStatusInfo(statusInfo);
		
		return departmentDetailsResponse;
	}
	
	@RequestMapping(value = "/department/departmentInfo", method = RequestMethod.POST)
	DepartmentInfoResponse departmentInfo(@RequestBody DepartmentInfoRequest departmentInfoRequest) {
		DepartmentInfoResponse departmentInfoResponse = new DepartmentInfoResponse();
		StatusInfo statusInfo = null;
		try {
			departmentInfoResponse = departmentService.departmentInfo(departmentInfoRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		departmentInfoResponse.setStatusInfo(statusInfo);
		return departmentInfoResponse;
	}
	
	@RequestMapping(value = "/department/delete", method = RequestMethod.POST)
	public DepartmentDeleteResponse departmentDelete(@RequestBody DepartmentDeleteRequest departmentDeleteRequest) {
		DepartmentDeleteResponse response = new DepartmentDeleteResponse();
		StatusInfo statusInfo = null;
		try {
			boolean isSuccess = departmentService.departmentDelete(Long.parseLong(departmentDeleteRequest.getDepartmentId()));
			if (isSuccess) {
				statusInfo = new StatusInfo(StatusInfo.SUCCESS, "Delete successfully");
			} else {
				throw new Exception("Can not delete department");
			}
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}
}
