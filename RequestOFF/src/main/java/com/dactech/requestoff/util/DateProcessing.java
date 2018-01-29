package com.dactech.requestoff.util;

import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class DateProcessing {
	// calculate diffWorkingHours between 2 time
	// except weekend and the hour without working
	// minute, second and millisecon are ignore
	// return :
	// 0 : 2 time are the same
	// >0 : after > before
	// <0 : after < before
	public static int diffHours(Date before, Date after) {
		if (after.equals(before))
			return 0;

		Date start, end;
		int returnNumberSign;
		if (after.after(before)) {
			end = after;
			start = before;
			returnNumberSign = 1;
		} else {
			end = before;
			start = after;
			returnNumberSign = -1;
		}

		// create calendar object from date object
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		startCal.setTime(start);
		endCal.setTime(end);
		

		int diffHours = 0;
		if (startCal.get(Calendar.YEAR) == endCal.get(Calendar.YEAR)
				&& startCal.get(Calendar.DAY_OF_YEAR) == endCal.get(Calendar.DAY_OF_YEAR)) { // 2 time in the same day
			if (!isWeekend(startCal)) { //if this day is not the weekend
				diffHours = diffHoursInOneDay(startCal, endCal); // calculate time in this day
			} else {
				diffHours = 0;
			}
		} else { // 2 time in the different day
			Calendar tempCal = Calendar.getInstance();

			// calculate time for the first day
			tempCal.setTime(start);
			tempCal.set(Calendar.HOUR_OF_DAY, 18);
			if (!isWeekend(startCal)) {
				diffHours += diffHoursInOneDay(startCal, tempCal);
			}

			// calculate time for the last day
			tempCal.setTime(end);
			tempCal.set(Calendar.HOUR_OF_DAY, 7);
			if (!isWeekend(endCal)) {
				diffHours += diffHoursInOneDay(tempCal, endCal);
			}

			// calculate time for the all working days between first day and last day
			tempCal.setTime(start);

			tempCal.set(Calendar.HOUR_OF_DAY, 0); // set all the time to 0 to use the before function for comparing date
			tempCal.set(Calendar.MINUTE, 0);
			tempCal.set(Calendar.SECOND, 0);
			tempCal.set(Calendar.MILLISECOND, 0);

			endCal.set(Calendar.HOUR_OF_DAY, 0);
			endCal.set(Calendar.MINUTE, 0);
			endCal.set(Calendar.SECOND, 0);
			endCal.set(Calendar.MILLISECOND, 0);

			tempCal.add(Calendar.DATE, 1); // add one day to tempCal, add 1 to month if the day is over number day of
											// last month
			while (tempCal.before(endCal)) {
				if (!isWeekend(tempCal)) {
					diffHours += 8;
				}
				tempCal.add(Calendar.DATE, 1);
			}
		}

		return diffHours * returnNumberSign;
	}

	// calculate the diffHours between 2 times in 1 day
	// 2 time must be in one day
	// the timeAfter must be after the timeBefore
	// minute, second and millisecond are ignore
	public static int diffHoursInOneDay(Calendar timeBefore, Calendar timeAfter) {
		if (timeBefore.get(Calendar.YEAR) != timeAfter.get(Calendar.YEAR)
				|| timeBefore.get(Calendar.DAY_OF_YEAR) != timeAfter.get(Calendar.DAY_OF_YEAR)
				|| timeBefore.after(timeAfter)) {
			return 0;
		}

		int diff = 0;
		int iterator = timeBefore.get(Calendar.HOUR_OF_DAY);
		while (iterator < timeAfter.get(Calendar.HOUR_OF_DAY)) {
			iterator++;
			if ((iterator >= 9 && iterator <= 12) || (iterator >= 14 && iterator <= 17)) {
				diff++;
			}
		}

		return diff;
	}
	
	// check whether a calendar is weekend
	public static boolean isWeekend(Calendar calendar) {
		return calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY
				|| calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY;
	}
	
	public static boolean isWeekend(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY
				|| calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY;
	}
}
