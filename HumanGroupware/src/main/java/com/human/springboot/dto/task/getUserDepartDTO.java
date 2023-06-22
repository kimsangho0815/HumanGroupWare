package com.human.springboot.dto.task;

import lombok.Data;

@Data
public class getUserDepartDTO {
	String emp_name;
	String managerName;
	int managerNum;
	int dep_id;
	String dep_name;
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public int getManagerNum() {
		return managerNum;
	}
	public void setManagerNum(int managerNum) {
		this.managerNum = managerNum;
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
}
