package com.human.springboot.dto;

import lombok.Data;

@Data
public class SwEdmsDTO extends SwEmpDTO{
    
    // edms
    private int edms_id;
    private String edms_category;
    private int edms_drafter;
    private int edms_mid_approver;
    private int edms_fnl_approver;
    private String edms_date;
    private String edms_status;
    private String edms_title;
    private String edms_mid_chk;
    private String edms_fnl_chk;
    private String edms_reason;

    private String mid_name;
    private String final_name;

    // edms_leave
    private int leave_id;
    private String leave_category;
    private String leave_start;
    private String leave_end;
    private String leave_detail;
    public int getEdms_id() {
		return edms_id;
	}
	public void setEdms_id(int edms_id) {
		this.edms_id = edms_id;
	}
	public String getEdms_category() {
		return edms_category;
	}
	public void setEdms_category(String edms_category) {
		this.edms_category = edms_category;
	}
	public int getEdms_drafter() {
		return edms_drafter;
	}
	public void setEdms_drafter(int edms_drafter) {
		this.edms_drafter = edms_drafter;
	}
	public int getEdms_mid_approver() {
		return edms_mid_approver;
	}
	public void setEdms_mid_approver(int edms_mid_approver) {
		this.edms_mid_approver = edms_mid_approver;
	}
	public int getEdms_fnl_approver() {
		return edms_fnl_approver;
	}
	public void setEdms_fnl_approver(int edms_fnl_approver) {
		this.edms_fnl_approver = edms_fnl_approver;
	}
	public String getEdms_date() {
		return edms_date;
	}
	public void setEdms_date(String edms_date) {
		this.edms_date = edms_date;
	}
	public String getEdms_status() {
		return edms_status;
	}
	public void setEdms_status(String edms_status) {
		this.edms_status = edms_status;
	}
	public String getEdms_title() {
		return edms_title;
	}
	public void setEdms_title(String edms_title) {
		this.edms_title = edms_title;
	}
	public String getEdms_mid_chk() {
		return edms_mid_chk;
	}
	public void setEdms_mid_chk(String edms_mid_chk) {
		this.edms_mid_chk = edms_mid_chk;
	}
	public String getEdms_fnl_chk() {
		return edms_fnl_chk;
	}
	public void setEdms_fnl_chk(String edms_fnl_chk) {
		this.edms_fnl_chk = edms_fnl_chk;
	}
	public String getEdms_reason() {
		return edms_reason;
	}
	public void setEdms_reason(String edms_reason) {
		this.edms_reason = edms_reason;
	}
	public String getMid_name() {
		return mid_name;
	}
	public void setMid_name(String mid_name) {
		this.mid_name = mid_name;
	}
	public String getFinal_name() {
		return final_name;
	}
	public void setFinal_name(String final_name) {
		this.final_name = final_name;
	}
	public int getLeave_id() {
		return leave_id;
	}
	public void setLeave_id(int leave_id) {
		this.leave_id = leave_id;
	}
	public String getLeave_category() {
		return leave_category;
	}
	public void setLeave_category(String leave_category) {
		this.leave_category = leave_category;
	}
	public String getLeave_start() {
		return leave_start;
	}
	public void setLeave_start(String leave_start) {
		this.leave_start = leave_start;
	}
	public String getLeave_end() {
		return leave_end;
	}
	public void setLeave_end(String leave_end) {
		this.leave_end = leave_end;
	}
	public String getLeave_detail() {
		return leave_detail;
	}
	public void setLeave_detail(String leave_detail) {
		this.leave_detail = leave_detail;
	}
	public int getLeave_period() {
		return leave_period;
	}
	public void setLeave_period(int leave_period) {
		this.leave_period = leave_period;
	}
	public int getLoa_id() {
		return loa_id;
	}
	public void setLoa_id(int loa_id) {
		this.loa_id = loa_id;
	}
	public String getLoa_detail() {
		return loa_detail;
	}
	public void setLoa_detail(String loa_detail) {
		this.loa_detail = loa_detail;
	}
	public int getLoa_expense() {
		return loa_expense;
	}
	public void setLoa_expense(int loa_expense) {
		this.loa_expense = loa_expense;
	}
	private int leave_period;

    // edms_loa
    private int loa_id;
    private String loa_detail;
    private int loa_expense;


}
