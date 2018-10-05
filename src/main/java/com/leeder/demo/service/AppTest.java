package com.leeder.demo.service;

import java.util.List;
import java.util.Map;

import com.leeder.demo.domain.HistogramVO;
import com.leeder.demo.domain.MultiLineVO;

public interface AppTest {
	List<HistogramVO> getTestData();
	
	Map<String,List<MultiLineVO>>  getDataByYear();

}
