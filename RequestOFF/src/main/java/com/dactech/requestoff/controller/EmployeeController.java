package com.dactech.requestoff.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dactech.requestoff.model.common.StatusInfo;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.request.EmployeeChangePasswordRequest;
import com.dactech.requestoff.model.request.EmployeeDeleteRequest;
import com.dactech.requestoff.model.request.EmployeeDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatisticsPagingRequest;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.request.GetUserRequest;
import com.dactech.requestoff.model.response.EmployeeChangePasswordResponse;
import com.dactech.requestoff.model.response.EmployeeDeleteResponse;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatisticsPagingResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;
import com.dactech.requestoff.model.response.GetUserResponse;
import com.dactech.requestoff.service.DepartmentService;
import com.dactech.requestoff.service.EmployeeService;
import com.dactech.requestoff.util.AuthenticationUtil;

@RestController
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	@Autowired
	DepartmentService departmentService;

	@RequestMapping(value = "/employee/regist", method = RequestMethod.POST)
	EmployeeRegistResponse employeeRegist(@RequestBody EmployeeRegistRequest employeeRegistRequest) {
		EmployeeRegistResponse response;
		try {
			response = employeeService.employeeRegist(employeeRegistRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			e.printStackTrace();
			response = new EmployeeRegistResponse();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}

		return response;
	}
	
	@RequestMapping(value = "/employee/delete", method = RequestMethod.POST)
	EmployeeDeleteResponse employeeDelete(@RequestBody EmployeeDeleteRequest employeeDeleteRequest) {System.out.println("ok");
		EmployeeDeleteResponse response = new EmployeeDeleteResponse();
		try {
			boolean isDeleted = employeeService.delete(Long.parseLong(employeeDeleteRequest.getId()));
			if (isDeleted == true) {
				response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
			} else {
				throw new Exception("Không thể xóa nhân viên");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}

		return response;
	}

	@RequestMapping(value = "/employee/search", method = RequestMethod.POST)
	EmployeeSearchResponse employeeSearch(@RequestBody EmployeeSearchRequest employeeSearchRequest) {
		EmployeeSearchResponse response = new EmployeeSearchResponse();
		StatusInfo statusInfo = null;
		try {
			response = employeeService.employeeSearch(employeeSearchRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}

	@RequestMapping(value = "/employee/details", method = RequestMethod.POST)
	EmployeeDetailsResponse employeeDetails(@RequestBody EmployeeDetailsRequest employeeDetailsRequest) {
		EmployeeDetailsResponse response = new EmployeeDetailsResponse();
		StatusInfo statusInfo = null;
		try {
			response = employeeService.employeeDetails(employeeDetailsRequest);
			statusInfo = new StatusInfo(StatusInfo.SUCCESS, null);
		} catch (Exception e) {
			statusInfo = new StatusInfo(StatusInfo.ERROR, e.getMessage());
		}
		response.setStatusInfo(statusInfo);
		return response;
	}

	@RequestMapping(value = "/employee/statisticsPaging", method = RequestMethod.POST)
	EmployeeOffStatisticsPagingResponse employeeStatisticsPaging(HttpServletRequest httpRequest,
			HttpServletResponse httpResponse, Model model) {
		EmployeeOffStatisticsPagingResponse response = new EmployeeOffStatisticsPagingResponse();
		try {
			EmployeeOffStatisticsPagingRequest request = new EmployeeOffStatisticsPagingRequest(httpRequest);
			response = employeeService.employeeOffStatisticsPaging(request);
		} catch (Exception e) {
			response.setError(e.getMessage());
		}
		return response;
	}

	@RequestMapping(value = "/employee/getUser", method = RequestMethod.POST)
	GetUserResponse getUser(@RequestBody GetUserRequest getUserRequest) {
		GetUserResponse response = new GetUserResponse();
		try {
			String email = AuthenticationUtil.getCurrentUserEmail();
			Employee user = employeeService.findByEmail(email);
			if (user == null) {
				throw new Exception("Không tìm thấy người dùng với email " + email);
			}
			
			user.setTeamName(employeeService.getTeamName(user.getId()));
			user.setDepartmentName(employeeService.getDepartmentName(user.getId()));
			
			response.setUser(user);
			
			if (user.getPosition().getCode() == Position.CODE_EMPLOYEE) {
				if(user.getListTeam() != null && user.getListTeam().size() > 0) {
					if(user.getListTeam().get(0).getLeaderId() == user.getId()) {
						response.setLeaderFlag(1);
					} else {
						response.setLeaderFlag(0);
					}
				} else {
					response.setLeaderFlag(0);
				}
			}
			
			List<GetUserResponse.IdName> forwards = employeeService.findForwardList(user.getId());
			response.setListForward(forwards);
			
			List<GetUserResponse.IdName> recipients = employeeService.getListRecipients((user.getId()));
			response.setListRecipients(recipients);
			
			double remainHours = employeeService.getRemainHours(user.getId());
			response.setRemainHours(remainHours);
			
			double displayedRemainHours = employeeService.getDisplayedRemainHours(user.getId());
			response.setDisplayedRemainHours(displayedRemainHours);
			
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		return response;
	}
	
	@RequestMapping(value = "/employee/changePassword", method = RequestMethod.POST)
	EmployeeChangePasswordResponse changePassword(@RequestBody EmployeeChangePasswordRequest employeeChangePasswordRequest) {
		EmployeeChangePasswordResponse response = new EmployeeChangePasswordResponse();
		try {
			employeeService.changePassword(employeeChangePasswordRequest);
			response.setStatusInfo(new StatusInfo(StatusInfo.SUCCESS, null));
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatusInfo(new StatusInfo(StatusInfo.ERROR, e.getMessage()));
		}
		return response;
	}
}
