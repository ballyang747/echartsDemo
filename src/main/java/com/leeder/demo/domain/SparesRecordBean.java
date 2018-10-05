package com.leeder.demo.domain;

import java.io.Serializable;
import java.util.Date;



import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.leeder.demo.utils.DataTimeJsonSerializer;

public class SparesRecordBean implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 604441981699202214L;
	
	private Integer id;
	
	private String name;
	
	private Integer sparesId;
	
	private String note;
	
	private Integer rType;
	
	private Integer num;
	
	@JsonSerialize(using=DataTimeJsonSerializer.class)
	private Date recordDate;

	private Integer status;
	
	@JsonSerialize(using=DataTimeJsonSerializer.class)
	private Date createTime;
	
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSparesId() {
		return sparesId;
	}

	public void setSparesId(Integer sparesId) {
		this.sparesId = sparesId;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getrType() {
		return rType;
	}

	public void setrType(Integer rType) {
		this.rType = rType;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Date getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
    //调试用
	@Override
	public String toString() {
		return "SparesRecord [id=" + id + ", sparesId=" + sparesId + ", note=" + note + ", rType=" + rType + ", num="
				+ num + ", recordDate=" + recordDate + ", status=" + status + ", createTime=" + createTime + "]";
	}
	

	
	
	
	

}
