package com.human.springboot.dto.note;

import lombok.Data;

@Data
public class UserDTO {
	private String emp_name;
	private int emp_no;
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
}
