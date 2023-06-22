package com.human.springboot.dto.task;

import lombok.Data;

@Data
public class getWorkDataDTO {
	int report_no;
	int dwork_id;
	String dwork_name;
	int dwork_writer;
	int dwork_depart;
	String dwork_content;
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getDwork_id() {
		return dwork_id;
	}
	public void setDwork_id(int dwork_id) {
		this.dwork_id = dwork_id;
	}
	public String getDwork_name() {
		return dwork_name;
	}
	public void setDwork_name(String dwork_name) {
		this.dwork_name = dwork_name;
	}
	public int getDwork_writer() {
		return dwork_writer;
	}
	public void setDwork_writer(int dwork_writer) {
		this.dwork_writer = dwork_writer;
	}
	public int getDwork_depart() {
		return dwork_depart;
	}
	public void setDwork_depart(int dwork_depart) {
		this.dwork_depart = dwork_depart;
	}
	public String getDwork_content() {
		return dwork_content;
	}
	public void setDwork_content(String dwork_content) {
		this.dwork_content = dwork_content;
	}
	public String getDwork_notes() {
		return dwork_notes;
	}
	public void setDwork_notes(String dwork_notes) {
		this.dwork_notes = dwork_notes;
	}
	public String getDwork_created() {
		return dwork_created;
	}
	public void setDwork_created(String dwork_created) {
		this.dwork_created = dwork_created;
	}
	String dwork_notes;
	String dwork_created;
}
