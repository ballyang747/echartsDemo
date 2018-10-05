package com.leeder.demo.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope("singleton")
public class RandomData {

	
	Random rand = new Random();
	


	
	public Integer getRandomNum() {
		
		int index = rand.nextInt(50);
		
		return index;
	}
	
	public String getRandomMachine() {
		int index = rand.nextInt(6);
		if(index == 0) {
			return "方向盘";
		}else if(index ==1) {
			return "卤素灯";
		}else if(index == 2) {
			return "发动机";
		}else if (index ==3) {
			return "变速箱";
		}else if (index ==4) {
			return "底盘";
		}else {
			return "传动轴";
		}
		
	}
	
	public int getRandomType() {
		int index = rand.nextInt(5);
		if(index == 0) {
			return 1;
		}else if(index ==1) {
			return 2;
		}else if(index == 2) {
			return 3;
		}else if (index ==3) {
			return 4;
		}else  {
			return 5;
		}
		
	}

		
	
	}


