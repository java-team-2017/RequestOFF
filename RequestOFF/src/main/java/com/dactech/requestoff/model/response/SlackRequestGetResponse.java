package com.dactech.requestoff.model.response;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SlackRequestGetResponse {
	private String ok;
	@JsonProperty("has_more")
	private String hasMore;
	private String latest;
	private String oldest;
	private String error;
	private List<SlackMsg> messages;

	public SlackRequestGetResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getOk() {
		return ok;
	}

	public void setOk(String ok) {
		this.ok = ok;
	}

	public String getHasMore() {
		return hasMore;
	}

	public void setHasMore(String hasMore) {
		this.hasMore = hasMore;
	}

	public String getLatest() {
		return latest;
	}

	public void setLatest(String latest) {
		this.latest = latest;
	}

	public String getOldest() {
		return oldest;
	}

	public void setOldest(String oldest) {
		this.oldest = oldest;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public List<SlackMsg> getMessages() {
		return messages;
	}

	public void setMessages(List<SlackMsg> messages) {
		this.messages = messages;
	}

	public SlackRequestGetResponse(String ok, String hasMore, String latest, String oldest, String error,
			List<SlackMsg> messages) {
		super();
		this.ok = ok;
		this.hasMore = hasMore;
		this.latest = latest;
		this.oldest = oldest;
		this.error = error;
		this.messages = messages;
	}

	public static class SlackMsg {
		private String text;
		private String ts;
		private String type;
		private String user;

		public SlackMsg() {
			super();
			// TODO Auto-generated constructor stub
		}

		public SlackMsg(String text, String ts, String type, String user) {
			super();
			this.text = text;
			this.ts = ts;
			this.type = type;
			this.user = user;
		}

		public String getText() {
			return text;
		}

		public void setText(String text) {
			this.text = text;
		}

		public String getTs() {
			return ts;
		}

		public void setTs(String ts) {
			this.ts = ts;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public String getUser() {
			return user;
		}

		public void setUser(String user) {
			this.user = user;
		}

	}
}
