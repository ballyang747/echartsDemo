package com.leeder.demo.dao;

import java.util.List;

import com.leeder.demo.domain.HistogramVO;
import com.leeder.demo.domain.MultiLineVO;
import com.leeder.demo.domain.SparesRecordBean;

public interface SparesRecord {
	
	 void insertData (List<SparesRecordBean> sr);
	 
	 List<HistogramVO> getTestData();
	 
	 List<MultiLineVO> getDataByYear();

}
