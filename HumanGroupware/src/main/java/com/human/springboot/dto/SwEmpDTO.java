package com.human.springboot.dto;

import lombok.Data;

@Data
public class SwEmpDTO {
    
    private int emp_no;
    private String emp_id;
    private String emp_name;
    private int emp_position;
    private int emp_depart;
    private String emp_email;
    private String board_authority;

    private int dep_id;
    private String dep_name;

    private int position_id;
    public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public int getEmp_position() {
		return emp_position;
	}
	public void setEmp_position(int emp_position) {
		this.emp_position = emp_position;
	}
	public int getEmp_depart() {
		return emp_depart;
	}
	public void setEmp_depart(int emp_depart) {
		this.emp_depart = emp_depart;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getBoard_authority() {
		return board_authority;
	}
	public void setBoard_authority(String board_authority) {
		this.board_authority = board_authority;
	}
	public int getDep_id() {
		return dep_id;
	}
	public void setDep_id(int dep_id) {
		this.dep_id = dep_id;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	public int getPosition_id() {
		return position_id;
	}
	public void setPosition_id(int position_id) {
		this.position_id = position_id;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	private String position_name;
}
