package com.leeder.demo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.leeder.demo.dao.SparesRecord;
import com.leeder.demo.domain.HistogramVO;
import com.leeder.demo.domain.MultiLineVO;
import com.leeder.demo.domain.UpdateVo;
import com.leeder.demo.service.AppTest;
@Service
public class AppTestImpl implements AppTest {
	@Autowired
	private SparesRecord sparesRecord;

	@Override
	public List<HistogramVO> getTestData() {
		
	
		return sparesRecord.getTestData();
	}

	@Override
	public Map<String, List<MultiLineVO>> getDataByYear() {
		List<MultiLineVO> dataByYear = sparesRecord.getDataByName();
		Map<String, List<MultiLineVO>> data =new HashMap<>();
		 List<MultiLineVO> datas = new ArrayList<>();
		for (MultiLineVO multiLineVO : dataByYear) {
			String name = multiLineVO.getName();
			if(!data.containsKey(name)) {
				datas = new ArrayList<>();
				data.put(name, datas);
			}
			
			datas.add(multiLineVO);
		}
		
		
		return data;
	}

	@Override
	public List<UpdateVo> getDataByDays() {
		
		return sparesRecord.getDataByDay();
	}

}
