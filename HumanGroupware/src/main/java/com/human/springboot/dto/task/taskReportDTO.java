package com.human.springboot.dto.task;

import lombok.Data;

@Data
public class taskReportDTO {
	
	int tr_id;
	int tr_no;
	int tr_depart;
	int tr_writer;
	
	String tr_title;
	String tr_content;
	String tr_condition;
	String tr_created;
	
	public int getTr_id() {
		return tr_id;
	}

	public void setTr_id(int tr_id) {
		this.tr_id = tr_id;
	}

	public int getTr_no() {
		return tr_no;
	}

	public void setTr_no(int tr_no) {
		this.tr_no = tr_no;
	}

	public int getTr_depart() {
		return tr_depart;
	}

	public void setTr_depart(int tr_depart) {
		this.tr_depart = tr_depart;
	}

	public int getTr_writer() {
		return tr_writer;
	}

	public void setTr_writer(int tr_writer) {
		this.tr_writer = tr_writer;
	}

	public String getTr_title() {
		return tr_title;
	}

	public void setTr_title(String tr_title) {
		this.tr_title = tr_title;
	}

	public String getTr_content() {
		return tr_content;
	}

	public void setTr_content(String tr_content) {
		this.tr_content = tr_content;
	}

	public String getTr_condition() {
		return tr_condition;
	}

	public void setTr_condition(String tr_condition) {
		this.tr_condition = tr_condition;
	}

	public String getTr_created() {
		return tr_created;
	}

	public void setTr_created(String tr_created) {
		this.tr_created = tr_created;
	}

	public int getTr_receiver() {
		return tr_receiver;
	}

	public void setTr_receiver(int tr_receiver) {
		this.tr_receiver = tr_receiver;
	}

	int tr_receiver;
}
