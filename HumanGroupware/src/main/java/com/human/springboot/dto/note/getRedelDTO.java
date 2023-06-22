package com.human.springboot.dto.note;

import lombok.Data;

@Data
public class getRedelDTO {
	
	int note_id;
	int note_writer;
	String sender;
	String note_content;
	String note_senddate;
	public int getNote_id() {
		return note_id;
	}
	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}
	public int getNote_writer() {
		return note_writer;
	}
	public void setNote_writer(int note_writer) {
		this.note_writer = note_writer;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getNote_content() {
		return note_content;
	}
	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}
	public String getNote_senddate() {
		return note_senddate;
	}
	public void setNote_senddate(String note_senddate) {
		this.note_senddate = note_senddate;
	}
	
}
