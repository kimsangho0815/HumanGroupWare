package com.human.springboot.dto.note;

import lombok.Data;

@Data
public class selectSeMgDTO {
	int note_id;
	int note_recipient;
	String emp_name ; 
	String note_content ; 
	String note_senddate;
	public int getNote_id() {
		return note_id;
	}
	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}
	public int getNote_recipient() {
		return note_recipient;
	}
	public void setNote_recipient(int note_recipient) {
		this.note_recipient = note_recipient;
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
}
