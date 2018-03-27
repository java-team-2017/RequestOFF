package com.dactech.requestoff.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;

import com.dactech.requestoff.model.entity.SlackRequest;
import com.dactech.requestoff.model.response.SlackRequestGetResponse.SlackMsg;
import com.dactech.requestoff.service.EmployeeService;

public class SlackUtil {
	@Autowired
	EmployeeService employeeService;

	public static SlackRequest processSlackMessage(SlackMsg message) {
		SlackRequest slackRequest = new SlackRequest();
		slackRequest.setMsgContent(message.getText());
		slackRequest.setMsgUserId(message.getUser());
		slackRequest.setValidFlag(1);

		slackRequest.setMsgTime((long) Double.parseDouble(message.getTs()) * 1000);

		slackRequest.setProcessFlag(SlackRequest.UNPROCESSED);
		slackRequest.setIsValidMsg(SlackRequest.VALID_REQUEST_MSG);

		String errMsg = "";

		System.out.println("\n\n\nraw message =====================================\n" + message.getText() + "\n");
		StringTokenizer msg = new StringTokenizer(message.getText());
		while (msg.hasMoreTokens()) {
			String line = msg.nextToken("\n");
			if (line.toLowerCase().indexOf("has joined the channel") != -1 || line.indexOf("Automatic Request Off") != -1) {
				slackRequest.setProcessFlag(SlackRequest.PROCESSED);
				slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
				return slackRequest;
			}
		}

		msg = new StringTokenizer(message.getText());
		
		System.out.println(message.getText() + "\n\n--------------------");
		
		boolean isRequestOff = false;
		while (msg.hasMoreTokens()) {
			String line = msg.nextToken("\n");
			if (line.toLowerCase().indexOf("request off") != -1) {
				isRequestOff = true;
				break;
			}
		}

		if (!isRequestOff) {
			System.err.println("Not a Request Off message");
			slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
			errMsg = errMsg + "This message is not a request off\n";
		} else {
			System.out.println("Message info========================\n");
			String name = "", reason = "";
			String totalTime = "", totalTimeUnit = "", startDay = "", endDay = "";

			// get Name
			msg = new StringTokenizer(message.getText());
			String nameLine = "";
			while (msg.hasMoreTokens()) {
				String line = msg.nextToken("\n");
				if (line.toLowerCase().indexOf("name") != -1) {
					nameLine = line;
					break;
				}
			}
			if (nameLine.length() != 0) {
				Matcher nameMatcher = Pattern.compile(".*((name)|(Name)).*:\\s*(\\p{L}.*)").matcher(nameLine);
				if (nameMatcher.find()) {
					name = nameMatcher.group(4);
					System.out.println("Name          :_" + name + "_");
					slackRequest.setName(StringUtil.standardizeName(name));
				} else {
					slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
					errMsg = errMsg + "Name line syntax error\n";
					System.err.println("Name line syntax error");
				}
			} else {
				slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
				errMsg = errMsg + "Name is not found\n";
				System.err.println("Name is not found");
			}

			// get Day Off
			msg = new StringTokenizer(message.getText());
			String dayOffLine = "";
			while (msg.hasMoreTokens()) {
				String line = msg.nextToken("\n");
				if (line.toLowerCase().indexOf("day off") != -1 || line.toLowerCase().indexOf("date off") != -1) {
					dayOffLine = line;
					break;
				}
			}

			if (dayOffLine.length() != 0) {
				System.out.println(dayOffLine);
				Matcher totalTimeMatcher = Pattern.compile(":\\s*([0-9\\.,]+)\\s*([dDhHmM])").matcher(dayOffLine);
				if (totalTimeMatcher.find()) {
					totalTimeUnit = totalTimeMatcher.group(2);
					totalTime = totalTimeMatcher.group(1).replace(',', '.');
					double totalHours = 0;
					double totalHoursD = Double.parseDouble(totalTime);

					if (totalTimeUnit.equalsIgnoreCase("d")) { // day case
						System.out.println("Total time    :_" + totalTime + "_days");
						totalHoursD = totalHoursD * 8;
						totalHours = (int) totalHoursD;
					} else if (totalTimeUnit.equalsIgnoreCase("h")) { // hour case
						System.out.println("Total time    :_" + totalTime + "_hours");
						totalHours = totalHoursD;
					} else { // minute case
						System.out.println("Total time    :_" + totalTime + "_minutes");
						totalHoursD = totalHoursD / 30;
						totalHours = Math.ceil(totalHoursD) / 2;
					}
					slackRequest.setTotalHours(totalHours);
					System.out.println("Time in hour  :_" + totalHours + "_");
				} else {
					slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
					errMsg = errMsg + "Total hours syntax error\n";
					System.err.println("total hours syntax error");
				}

				Matcher dayMatcher = Pattern.compile("(\\d+/\\d+/\\d+)").matcher(dayOffLine);
				if (dayMatcher.find()) {
					startDay = dayMatcher.group();
					if (dayMatcher.find()) {
						endDay = dayMatcher.group();
					} else {
						endDay = startDay;
					}
					System.out.println("start day     : " + startDay);
					System.out.println("end day       : " + endDay);

					SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
					try {
						Date startDaytDate = formatter.parse(startDay);
						Date endDayDate = formatter.parse(endDay);

						SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						slackRequest.setDayOffFrom(formatter2.format(startDaytDate));
						slackRequest.setDayOffTo(formatter2.format(endDayDate));
					} catch (ParseException e) {
						slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
						errMsg = errMsg + "Day off syntax error\n";
						e.printStackTrace();
					}
				} else {
					slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
					errMsg = errMsg + "Day off syntax error\n";
					System.err.println("day off syntax error");
				}
			} else {
				slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
				errMsg = errMsg + "Day off is not found\n";
				System.err.println("Day off is not found");
			}

			// get Reason
			msg = new StringTokenizer(message.getText());
			String reasonLine = "";
			while (msg.hasMoreTokens()) {
				String line = msg.nextToken("\n");
				if (line.toLowerCase().indexOf("reason") != -1) {
					reasonLine = line;
					break;
				}
			}
			if (reasonLine.length() != 0) {
				Matcher reasonMatcher = Pattern.compile(".*((reason)|(Reason)).*:\\s*(\\w.*)").matcher(reasonLine);
				if (reasonMatcher.find()) {
					reason = reasonMatcher.group(4);
					System.out.println("Reason          :_" + reason + "_");
					slackRequest.setReason(reason);
				} else {
					slackRequest.setIsValidMsg(SlackRequest.INVALID_REQUEST_MSG);
					errMsg = errMsg + "Reason line syntax error\n";
					System.err.println("Reason line syntax error");
				}
			} else {
				errMsg = errMsg + "Reason is not found\n";
				System.err.println("Reason is not found");
			}
		}
		slackRequest.setErrMsg(errMsg);
		return slackRequest;
	}
}
