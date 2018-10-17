package com.leeder.demo.domain;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.leeder.demo.utils.DataTimeJsonSerializer;

public class UpdateVo {
	@JsonSerialize(using=DataTimeJsonSerializer.class)
	private Date recordDate;
	
	private Integer num;

	public Date getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
	
	

}
