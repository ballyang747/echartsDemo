package com.leeder.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeder.demo.domain.HistogramVO;
import com.leeder.demo.domain.MultiLineVO;
import com.leeder.demo.service.AppTest;

@Controller
public class AppController {
	@Autowired
	private AppTest appTest;
	
	@RequestMapping("/")
	public String welcome() {
		
		return "index";
	}
	
	@ResponseBody
	 @RequestMapping(value="/test",produces= {"application/json;charset=utf-8"})
	public List<HistogramVO> getTestData() {
		
		
		return appTest.getTestData();
	}
	
	@ResponseBody
	 @RequestMapping(value="/test2",produces= {"application/json;charset=utf-8"})
	public  Map<String, List<MultiLineVO>> getTestData2() {
		
		
		return appTest.getDataByYear();
	}
	
	

}
