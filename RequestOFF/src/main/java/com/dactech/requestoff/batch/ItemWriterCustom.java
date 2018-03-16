package com.dactech.requestoff.batch;

import java.util.List;

import org.springframework.batch.item.ItemWriter;
import org.springframework.beans.factory.annotation.Autowired;

import com.dactech.requestoff.model.entity.SlackRequest;
import com.dactech.requestoff.service.SlackRequestService;

public class ItemWriterCustom implements ItemWriter<SlackRequest>{
	public ItemWriterCustom() {
		super();
	}
	@Autowired
	SlackRequestService slackService;
	@Override
	public void write(List<? extends SlackRequest> slackRequests) throws Exception {
		SlackRequest slack = slackRequests.get(0);
		slackService.save(slack);
	}

}
