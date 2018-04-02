var webRootPath = '/';

$(function() {
	$(".only-number").on("keypress", function(event) {
		if ((event.keyCode < 48 && event.keyCode != 45) || event.keyCode > 57) {
			event.preventDefault();
		}
		if($(this).val() == '') {
			if ((event.keyCode < 48 && event.keyCode != 45) || event.keyCode > 57) {
				event.preventDefault();
			}
		} else if($(this).val()[0] == '-') {
			if (event.keyCode == 45) {
				event.preventDefault();
			}
			$(this).attr('maxlength', '3');
		} else {
			if (event.keyCode == 45) {
				event.preventDefault();
			}
			$(this).attr('maxlength', '2');
		}
	});
	
	$(".only-positive-number").on("keypress", function(event) {
		if (event.keyCode < 48 || event.keyCode > 57) {
			event.preventDefault();
		}
	});
	
	$('fieldset div.filter-collapse').on('show.bs.collapse', function () {
		$(this).parent().find('i.filter-toggle-icon').removeClass("glyphicon-triangle-right");
		$(this).parent().find('i.filter-toggle-icon').addClass("glyphicon-triangle-bottom");
	});
	
	$('fieldset div.filter-collapse').on('hidden.bs.collapse', function () {
		$(this).parent().find('i.filter-toggle-icon').removeClass("glyphicon-triangle-bottom");
		$(this).parent().find('i.filter-toggle-icon').addClass("glyphicon-triangle-right");
	});
	
	
	var pathname = $(location).attr('pathname');
	$('#navbarOfMe').find('li').each(function(i, li) {
		var selectedHref = $(this).find("a").attr('href');
		if(selectedHref.localeCompare(pathname) == 0) {
			$(this).addClass('active-menu');
		}
	});
	
});

var errors = {
	'DateError': 'Thời gian trong ô \'đến\' phải sau thời gian trong ô \'từ\'',
	'incompleteFields': 'Vui lòng điền vào tất cả các ô bắt buộc',
	'offHoursEqual0': 'Thời gian nghỉ phải lớn hơn 0 giờ',
	'exceedTime': 'Thời gian nghỉ vượt quá thời gian nghỉ phép còn lại',
	'stringExceedLimit': 'Độ dài chuỗi vượt quá độ dài cho phép',
	'APIResponseError': function (errMsg) {
		return errMsg;
	}
};

var requestStatus = {
	'1': 'Đã lưu',
	'2': 'Đã duyệt',
	'3': 'Đã từ chối',
	'4': 'Đã phản hồi',
	'5': 'Đang chờ'
};

var userData;
function getLoggedUser(callbackFunc){
	$.ajax({
		type : "post",
		contentType : "application/json",
		url : webRootPath + "employee/getUser",
		data : JSON.stringify({}),
		dataType : 'json',
		success : function(data) {
			userData = data;
			if (typeof callbackFunc !== 'undefined'){
				callbackFunc(data);
			}
		},
		error : function(e) {
			$('#alertMessage').html(errors['APIResponseError'](e)).attr('class', 'alert alert-danger').show();
		}
	});
}

function renderNumberOfRequest(userId){
	$.ajax({
		type: "POST",
		contentType: "application/json",
		url : webRootPath + "request/getRequestBrowsing",
		dataType : 'json',
		data : JSON.stringify({"user_id" : userId, "status" : "5", "from_time" : "01/01/" + new Date().getFullYear()}),
		success : function(data) {
			var countRequest = 0;
			$.each(data.requests, function(index, returnRequest){
				if(userData.user.name == returnRequest.recipientName){
					countRequest ++;
				}
			});
			if(countRequest > 0){
				$('#numberOfRequest').html(countRequest);
			} else {
				$('#numberOfRequest').hide();
			}
		},
		error : function(e) {
			console.log(html(errors['APIResponseError'](e)));
		}
	});
}

function renderRemainHours(remainHours, containerId) {
	var days = parseInt(parseFloat(remainHours) / 8);
	var hours = parseFloat(remainHours) - (days * 8);
	htmlStr = "";
	if(days < 2) {
		htmlStr = days + " ngày và " + hours + " giờ";
	}
	else {
		htmlStr = days + " ngày và " + hours + " giờ";
	}
	$("#" + containerId).html(htmlStr);
}

function renderDayOffTypeSelect(containerId) {
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : webRootPath + "dayOffType/search",
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

function renderRecipientSelect(listRecipient, selectBoxId) {
	var option = "";
	$.each(listRecipient, function(i, element) {
		option += "<option value='" + element.id + "'>" + element.name + "</option>"; 
	});
	$("#" + selectBoxId).append(option);
}

function renderPositionSelect(selectBoxIds, dataHandler) {
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
					if (selectBoxIds instanceof Array){
						$.each(selectBoxIds, function(i, item){
							$('#' + item).append('<option value="' + position.id + '">' + position.name + '</option>');
						});
					} else {
						$('#' + selectBoxIds).append('<option value="' + position.id + '">' + position.name + '</option>');
					}
				});
				if (typeof(dataHandler) == 'function') {
					dataHandler(listPosition);
				}
			} else {
				console.log(positionSearchResponse.status_info.error);
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}

function renderDepartmentSelect(selectBoxIds, dataHandler) {
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
				$('#' + selectBoxIds).empty().append('<option value=""></option>');
				$.each(listDepartment, function(index, department) {
					if (selectBoxIds instanceof Array){
						$.each(selectBoxIds, function(i, item){
							$('#' + item).append('<option value="' + department.id + '">' + department.name + '</option>');
						});
					} else {
						$('#' + selectBoxIds).append('<option value="' + department.id + '">' + department.name + '</option>');
					}
				});
				if (typeof(dataHandler) == 'function') {
					dataHandler(listDepartment);
				}
			} else {
				console.log(departmentSearchResponse.status_info.error);
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}

function renderTeamSelect(selectBoxIds, dataHandler) {
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
				$('#' + selectBoxIds).empty().append('<option value=""></option>');
				$.each(listTeam, function(index, team) {
					if (selectBoxIds instanceof Array){
						$.each(selectBoxIds, function(i, item){
							$('#' + item).append('<option value="' + team.id + '">' + team.name + '</option>');
						});
					} else {
						$('#' + selectBoxIds).append('<option value="' + team.id + '">' + team.name + '</option>');
					}
				});
				dataHandler(listTeam);
			} else {
				console.log(teamSearchResponse.status_info.error);
			}
		},
		error: function() {
			console.log("error");
		}
	});
}

function renderRoleSelect(selectBoxIds, dataHandler) {
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
					if (selectBoxIds instanceof Array){
						$.each(selectBoxIds, function(i, item){
							$('#' + item).append('<option value="' + role.id + '">' + role.role + '</option>');
						});
					} else {
						$('#' + selectBoxIds).append('<option value="' + role.id + '">' + role.role + '</option>');
					}
				});
				dataHandler(listRole);
			} else {
				console.log(roleSearchResponse.status_info.error);
			}
		},
		error: function() {
			console.log("error");
		}
	});
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
