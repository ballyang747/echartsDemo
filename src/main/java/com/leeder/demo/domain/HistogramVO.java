package com.leeder.demo.domain;

public class HistogramVO {
	private String name;
	
	private Integer num;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "HistogramVO [name=" + name + ", num=" + num + "]";
	}
	
	
}
