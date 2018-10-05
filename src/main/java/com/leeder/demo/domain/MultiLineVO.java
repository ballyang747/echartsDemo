package com.leeder.demo.domain;

public class MultiLineVO {
	private String name;
	
	private String year;
	
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "MultiLineVO [name=" + name + ", year=" + year + ", num=" + num + "]";
	}
   
	

	
	
}
