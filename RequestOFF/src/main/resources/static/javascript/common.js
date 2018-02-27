var webRootPath = '/';
var errors = {
	'DateError': 'time of To field must be after From field',
	'incompleteFields': 'Please fill in all required fields',
	'exceedTime': 'Hours of off time exceed remain hours',
	'roundHour': 'Your hours of off time must be round',
	'weekend': 'Your choosen hours are belong to weekends',
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

//function getDayOffTypeId(dayOffTypeList, dayOffTypeName) {
//	var id;
//	$.each(dayOffTypeList, function(i, element) {
//		if(dayOffTypeName.localeCompare(element.name) == 0) {
//			id = element.id;
//			return false;	//return false to break the loop
//		}
//	});
//	return id;
//}

//function getRecipientNameOrId(recipientList, recipientNameOrId) {
//	var returnValue;
//	$.each(recipientList, function(i, element) {
//		if(String(recipientNameOrId).localeCompare(element.name) == 0) {
//			returnValue = element.id;
//			return false;	//return false to break the loop
//		}
//		else if(String(recipientNameOrId).localeCompare(element.id) == 0) {
//			returnValue = element.name;
//			return false;	//return false to break the loop
//		}
//	});
//	return returnValue;
//}

//function getDayOffTypeNameOrId(dayOffTypeList, dayOffTypeNameOrId) {
//	var returnValue;
//	$.each(dayOffTypeList, function(i, element) {
//		if(String(dayOffTypeNameOrId).localeCompare(element.name) == 0) {
//			returnValue = element.id;
//			return false;	//return false to break the loop
//		}
//		else if(String(dayOffTypeNameOrId).localeCompare(element.id) == 0) {
//			returnValue = element.name;
//			return false;	//return false to break the loop
//		}
//	});
//	return returnValue;
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
	teamSelect = $('#' + selectBoxId);
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
				teamSelect.empty().append('<option value=""></option>');
				$.each(listTeam, function(index, team) {
					teamSelect.append('<option value="' + team.id + '">' + team.name + '</option>');
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
