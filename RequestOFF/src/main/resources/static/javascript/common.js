var errors = {
	'DateError': 'time of To field must be after From field',
	'incompleteFields': 'Please fill in all fields'
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