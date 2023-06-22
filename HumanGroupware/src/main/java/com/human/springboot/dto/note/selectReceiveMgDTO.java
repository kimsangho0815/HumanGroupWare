package com.human.springboot.dto.note;

import lombok.Data;

@Data
public class selectReceiveMgDTO {
	int sender_id;
	int note_id;
	String emp_name;
	String note_content;
	String note_senddate;
	String note_read;
	public int getSender_id() {
		return sender_id;
	}
	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}
	public int getNote_id() {
		return note_id;
	}
	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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
	public String getNote_read() {
		return note_read;
	}
	public void setNote_read(String note_read) {
		this.note_read = note_read;
	}
}
