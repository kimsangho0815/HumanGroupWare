package com.human.springboot.dto.task;

import lombok.Data;

@Data
public class getReportDTO {
	String report_style;
	String report_tag;
	public String getReport_style() {
		return report_style;
	}
	public void setReport_style(String report_style) {
		this.report_style = report_style;
	}
	public String getReport_tag() {
		return report_tag;
	}
	public void setReport_tag(String report_tag) {
		this.report_tag = report_tag;
	}
}
