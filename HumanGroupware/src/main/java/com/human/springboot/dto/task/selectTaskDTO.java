package com.human.springboot.dto.task;

import lombok.Data;

@Data
public class selectTaskDTO {
	int task_id;
	String task_name;
	int task_depart;
	int task_drafter;
	int task_performer;
	String task_started;
	String task_limit;
	String task_content;
	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public int getTask_depart() {
		return task_depart;
	}
	public void setTask_depart(int task_depart) {
		this.task_depart = task_depart;
	}
	public int getTask_drafter() {
		return task_drafter;
	}
	public void setTask_drafter(int task_drafter) {
		this.task_drafter = task_drafter;
	}
	public int getTask_performer() {
		return task_performer;
	}
	public void setTask_performer(int task_performer) {
		this.task_performer = task_performer;
	}
	public String getTask_started() {
		return task_started;
	}
	public void setTask_started(String task_started) {
		this.task_started = task_started;
	}
	public String getTask_limit() {
		return task_limit;
	}
	public void setTask_limit(String task_limit) {
		this.task_limit = task_limit;
	}
	public String getTask_content() {
		return task_content;
	}
	public void setTask_content(String task_content) {
		this.task_content = task_content;
	}
}
