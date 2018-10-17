package com.leeder.demo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.leeder.demo.dao.SparesRecord;
import com.leeder.demo.domain.HistogramVO;
import com.leeder.demo.domain.MultiLineVO;
import com.leeder.demo.domain.SparesRecordBean;
import com.leeder.demo.domain.UpdateVo;
import com.leeder.demo.utils.RandomData;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {
	@Autowired
	private SparesRecord sparesRecord;

	@Test
	public void contextLoads() {
	}
	
	//自动随机生成1000条数据
	@Test
	public void inserTest() throws ParseException {
		
		RandomData rd = new RandomData();

		
	       Calendar c = Calendar.getInstance();  
	       Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse("2018-10-5");
	        c .setTime(d1);
	       
			 c.add(Calendar.DATE, 1);
		
		    Date time = c.getTime();
		   
	     for (int i = 0; i < 5; i++) {
	    	 List<SparesRecordBean> list1 = new ArrayList<SparesRecordBean>();
	    	 for (int j = 0; j < 200; j++) {
	    		 Calendar dd = Calendar.getInstance();  
	    		 SparesRecordBean sr = new SparesRecordBean();
	    		dd.setTime(time);
			    dd.add(Calendar.DATE, 1);
			     time = dd.getTime();

	    		 sr.setCreateTime(new Date());
	    		 sr.setNote("test");
	    		 sr.setNum(rd.getRandomNum());
	    		 sr.setrType(rd.getRandomType());
	    		 sr.setSparesId(123);
	    		 sr.setName(rd.getRandomMachine());
	    		 sr.setStatus(1);
	    		 sr.setRecordDate(time);
	    		 list1.add(sr);
			}
	    	 sparesRecord.insertData(list1);
	    	 list1.removeAll(list1);
			
		}
		
		
		
	}
	
	@Test
	public void getTest() {
		List<HistogramVO> testData = sparesRecord.getTestData();
		
		for (HistogramVO sparesRecord : testData) {
			System.out.println(sparesRecord);
		}
		
	}
	
	@Test
	public void getTest2() {
	List<MultiLineVO> dataByYear = sparesRecord.getDataByName();
		
		for (MultiLineVO sparesRecord : dataByYear) {
			System.out.println(sparesRecord);
		}
		
	}
	
	
	@Test
	public void getTest3() {
		List<UpdateVo> dataByDays = sparesRecord.getDataByDay();
		
		for (UpdateVo sparesRecord : dataByDays) {
			System.out.println(sparesRecord);
		}
		
	}

}
