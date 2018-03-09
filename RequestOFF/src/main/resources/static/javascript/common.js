var webRootPath = '/';
var errors = {
	'DateError': 'time of To field must be after From field',
	'incompleteFields': 'Please fill in all required fields',
	'offHoursEqual0': 'Off hours must be greater than 0',
	'exceedTime': 'Hours of off time exceed remain hours',
	'roundHour': 'Your hours of off time must be round',
	'weekend': 'Your choosen hours are belong to weekends',
	'stringExceedLimit': 'Values exceed the limit',
	'notNumber' : 'value of number textbox is not a number',
	'APIResponseError': function (errMsg) {
		return errMsg;
	}
}

// usage example: $.notify(notification['DateError']);
//				  $.notify(notification['APIResponseError'](errMsg));
var notification = {
	'DateError': {
		message: 'time of To field must be after From field',
		status: 'error', // 'default', 'info', 'error', 'warning', 'success'
		timeout: 3000, // ms
		pos: 'top-center' // 'top-center','top-right', 'bottom-right', 'bottom-center', 'bottom-left'
	},'incompleteFields': {
		message: 'Please fill in all fields',
		status: 'error',
		timeout: 3000,
		pos: 'top-center'
	},'APIResponseError': function (errMsg) {
		return {
			message: '<h5 align = "center">API response error</h5>' + errMsg,
			status: 'error',
			timeout: 3000,
			pos: 'top-center'
		}
	},'exceedTime': {
		message: 'Hours of off time exceed remain hours',
		status: 'error',
		timeout: 3000,
		pos: 'top-center'
	}
	
}

//function notify(containerId, message) {
//	$('#' + containerId).attr('class', 'alert fade in alert-success').show();
//	$('#' + containerId + ' > span').html(message);
//}

function renderRemainHours(remainHours, containerId) {
	if(parseInt(remainHours) < 2) {
		$("#" + containerId).html(remainHours + " hour");
	}
	else {
		$("#" + containerId).html(remainHours + " hours");
	}
}

function renderDayOffTypeSelect(containerId) {
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/dayOffType/search",
//		url : /*[[@{/dayOffType/search}]]*/,
		dataType : 'json',
		data : JSON.stringify({"valid_flag_id" : "1"}),
		success : function(returnData) {
			var option = "";
			$.each(returnData.listDayOffType, function(i, element){
				option += "<option value='" + element.id + "'>" + element.name + "</option>"; 
			});
			$("#" + containerId).append(option);
		},
		error : function(e) {
			console.log(html(errors['APIResponseError'](e)));
		}
	});
}

//function renderRecipientSelect(employeeId, selectBoxId) {
//	$.ajax({
//		type : "POST",
//		contentType : "application/json",
//		url : "/employee/getListRecipients",
////		url : /*[[@{/employee/getListRecipients}]]*/,
//		dataType : 'json',
//		data : JSON.stringify({"employee_id" : employeeId}),
//		success : function(returnData) {
//			var option = "";
//			var listRecipient = returnData.list_recipients;
//			$.each(listRecipient, function(i, element) {
//				option += "<option value='" + element.id + "'>" + element.name + "</option>"; 
//			});
//			$("#" + selectBoxId).append(option);
//		},
//		error : function(e) {
//			$('#alertMessage').html(errors['APIResponseError'](e)).attr('class', 'alert alert-success').show();
//		}
//	});
//}

function renderRecipientSelect(listRecipient, selectBoxId) {
	var option = "";
	$.each(listRecipient, function(i, element) {
		option += "<option value='" + element.id + "'>" + element.name + "</option>"; 
	});
	$("#" + selectBoxId).append(option);
}

function renderPositionSelect(selectBoxId, dataHandler) {
	$.ajax({
		url: webRootPath + "position/search",
		type: "post",
		dataType:"json",
		contentType: "application/json",
		data: JSON.stringify({
			"valid_flag": 1
		}),
		success: function (positionSearchResponse){
			if (positionSearchResponse.status_info.status == 0) {
				listPosition = positionSearchResponse.listPosition;
				$.each(listPosition, function(index, position) {
					$('#' + selectBoxId).append('<option value="' + position.id + '">' + position.name + '</option>');
				});
				if (typeof(dataHandler) == 'function') {
					dataHandler(listPosition);
				}
			} else {
				$.notify(notification['APIResponseError'](positionSearchResponse.status_info.error));
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}

function renderDepartmentSelect(selectBoxId, dataHandler) {
	$.ajax({
		url: webRootPath + "department/search",
		type: "post",
		dataType:"json",
		contentType: "application/json",
		data: JSON.stringify({
			"valid_flag": 1
		}),
		success: function (departmentSearchResponse){
			if (departmentSearchResponse.status_info.status == 0) {
				listDepartment = departmentSearchResponse.listDepartment;
				$('#' + selectBoxId).empty().append('<option value=""></option>');
				$.each(listDepartment, function(index, department) {
					$('#' + selectBoxId).append('<option value="' + department.id + '">' + department.name + '</option>');
				});
				if (typeof(dataHandler) == 'function') {
					dataHandler(listDepartment);
				}
			} else {
				$.notify(notification['APIResponseError'](departmentSearchResponse.status_info.error));
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}

function renderTeamSelect(selectBoxId, dataHandler) {
	$.ajax({
		url: webRootPath + "team/search",
		type: "post",
		dataType:"json",
		contentType: "application/json",
		data: JSON.stringify({
			"valid_flag": 1
		}),
		success: function (teamSearchResponse){
			if (teamSearchResponse.status_info.status == 0) {
				listTeam = teamSearchResponse.teams;
				$('#' + selectBoxId).empty().append('<option value=""></option>');
				$.each(listTeam, function(index, team) {
					$('#' + selectBoxId).append('<option value="' + team.id + '">' + team.name + '</option>');
				});
				dataHandler(listTeam);
			} else {
				console.log(notification['APIResponseError'](teamSearchResponse.status_info.error))
			}
		},
		error: function() {
			console.log("error");
		}
	});
}

function renderRoleSelect(selectBoxId, dataHandler) {
	$.ajax({
		url: webRootPath + "role/search",
		type: "post",
		dataType:"json",
		contentType: "application/json",
		data: JSON.stringify({
			"valid_flag": 1
		}),
		success: function (roleSearchResponse){
			if (roleSearchResponse.status_info.status == 0) {
				listRole = roleSearchResponse.listRole;
				$.each(listRole, function(index, role) {
					$('#' + selectBoxId).append('<option value="' + role.id + '">' + role.role + '</option>');
				});
				dataHandler(listRole);
			} else {
				console.log(notification['APIResponseError'](roleSearchResponse.status_info.error))
			}
		},
		error: function() {
			console.log("error");
		}
	});
}

function renderDayOffSelect (remainHours, selectBoxId) {
	var days = parseInt(parseFloat(remainHours) / 8);
	$('#' + selectBoxId).empty();
	for(var i = 0; i <= days; i++) {
		$('#' + selectBoxId).append('<option value="' + i + '">' + i + '</option>');
	}
}

function getTeamId(listTeam, teamName) {
	var teamId = 0;
	$.each(listTeam, function(i, element) {
		if(teamName.localeCompare(element.name) == 0) {
			teamId = element.id;
			return false;	//return false to break the loop
		}
	});
	return teamId;
}

function getDepartmentId(listDepartment, departmentName) {
	var departmentId = 0;
	$.each(listDepartment, function(i, element) {
		if(departmentName.localeCompare(element.name) == 0) {
			departmentId = element.id;
			return false;	//return false to break the loop
		}
	});
	return departmentId;
}
