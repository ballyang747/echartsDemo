package com.leeder.demo;

import java.util.Calendar;
import java.util.Date;

public class TimeTest {
	
	public static void main(String[] args) {
		 Calendar c = Calendar.getInstance();  
	   	c.setTime(new Date());
		 c.add(Calendar.DATE, 1);
		 Date time2 = c.getTime();
		 System.out.println(time2);
	     c.setTime(time2);
	     c.add(Calendar.DATE, 1);
	     Date time = c.getTime();
	     System.out.println(time);
	     c.setTime(time);
	     c.add(Calendar.DATE, 1);
	     Date time3 = c.getTime();
	     System.out.println(time3);
	}

}
