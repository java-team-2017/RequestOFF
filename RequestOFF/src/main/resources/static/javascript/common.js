var errors = {
	'DateError': 'time of To field must be after From field',
	'incompleteFields': 'Please fill in all fields',
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
	}
}

function getDayOffTypeId(dayOffTypeList, dayOffTypeName) {
	var id;
	$.each(dayOffTypeList, function(i, element) {
		if(dayOffTypeName.localeCompare(element.name) == 0) {
			id = element.id;
			return false;	//return false to break the loop
		}
	});
	return id;
}

function getRecipientNameOrId(recipientList, recipientNameOrId) {
	var returnValue;
	$.each(recipientList, function(i, element) {
		if(recipientNameOrId.localeCompare(element.name) == 0) {
			returnValue = element.id;
			return false;	//return false to break the loop
		}
		else if(recipientNameOrId.localeCompare(element.id) == 0) {
			returnValue = element.name;
			return false;	//return false to break the loop
		}
	});
	return returnValue;
}

function renderDayOffTypeSelect(selectBoxId) {
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/dayOffType/search",
		dataType : 'json',
		data : JSON.stringify({"valid_flag_id" : "1"}),
		success : function(returnData) {
			listDayOffType = returnData.listDayOffType;
			var option = "";
			$.each(returnData.listDayOffType, function(i, element){
				option += "<option value='" + element.name + "'>" + element.name + "</option>"; 
			});
			$("#" + selectBoxId).append(option);
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

function renderRemainHours(employee, containerId) {
	var currentYear = (new Date()).getFullYear();
	listEmployeeOffStatus = employee.listEmployeeOffStatus;
	var remainHours;
	$.each(listEmployeeOffStatus, function(i, element) {
		if(element.companyYearOff.id == currentYear) {
			remainHours = element.remainHours;
			return false;	//return false to break the loop
		}
	});
	remainHours = parseInt(remainHours);
	if(remainHours < 2) {
		$("#" + containerId).html(remainHours + " hour");
	}
	else {
		$("#" + containerId).html(remainHours + " hours");
	}
}

function getListRecipient(employee) {
	var listRecipient = [];
	if(employee.position.name == "leader") {
		listRecipient.push(employee.team.department.manager);
	}
	else {
		listRecipient.push(employee.listTeam[0].leader);
		listRecipient.push(employee.listTeam[0].department.manager);
	}
	return listRecipient;
}

function renderRecipientSelect(listRecipient, selectBoxId) {
	var option = "";
	$.each(listRecipient, function(i, element) {
		option += "<option value='" + element.name + "'>" + element.name + "</option>"; 
	});
	$("#" + selectBoxId).append(option);
}

function renderDepartmentSelect(selectBoxId, dataHandler) {
	$.ajax({
//		url: /*[[@{/department/search}]]*/,
		url: "/department/search",
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
//		url : /*[[@{/team/search}]]*/,
		url: "/team/search",
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
