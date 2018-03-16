package com.dactech.requestoff.batch;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.batch.item.ItemReader;

import com.dactech.requestoff.model.entity.SlackRequest;
import com.dactech.requestoff.util.SlackUtil;

public class IteamReaderCustom implements ItemReader<SlackRequest> {
	
	private int index;
	private List<SlackRequest> listRequest;
	private boolean reInitFlag;
	private Date lastTime;

	public IteamReaderCustom() throws Exception {
		lastTime = new Date();
		initialize();
	}

	private void initialize() throws Exception {
		
		String token = "xoxp-282152434071-281131491028-310284848339-c85d05498c88a7c78116a1517454f1ba";
		String channel = "C94BSF83C";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		Date oldest = sdf.parse("2017/07/10 8:00:00");
//		Date latest = sdf.parse("2017/07/10 12:00:00");
//		Date oldest = sdf.parse("2017/01/01 00:00:01");
//		Date latest = sdf.parse("2017/12/01 00:00:00");
//		slackRequestService.importSlackRequest(token, channel, latest, oldest);
		Date oldest = lastTime;
		Date latest = new Date();
		lastTime = new Date();
		listRequest= SlackUtil.getSlackRequest(token, channel, latest, oldest);
		System.err.println("number of slack request: " + listRequest.size());
	}

	@Override
	public SlackRequest read() throws Exception {
		SlackRequest nextRequest = null;
		if (reInitFlag == true) {
			initialize();
			reInitFlag = false;
		}
		if (index < listRequest.size()) {
			nextRequest = listRequest.get(index);
			index++;
		}
		if (nextRequest == null) {
			reInitFlag = true;
		}
		return nextRequest;
	}
}
