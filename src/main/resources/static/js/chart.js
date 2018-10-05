
$(function(){
	
$("#zhuzi").click(function(){
		 $("#test").empty();
		 $.ajax({
			 type:"post",
				url:"${ctx}/test",
		        datatype:"json",
				 success:function(text){
					 var data = text;
					    var xA = [];
					    var yA = [];
					    
					    $.each(data,function(i,val){
					    	 xA.push(val.name);
						        yA.push(val.num);
						 });					 
					 var myChart = echarts.init(document.getElementById('test'));
							 var option = {
									
							            title: {
							                text: '备件出库TOP6'
							            },
							            tooltip: {},
							            legend: {
							                data:['数量']
							            },
							            xAxis: {
							                data: xA
							            },
							            yAxis: {},
							            series: [{
							                name: '出库量',
							                type: 'bar',
							                data: yA
							            }]
							        };

					 myChart.setOption(option);
				 },error:function(){
			    	alert("提示信息");
			    	}
			 });                    
			 
			 
		 });});
$(function(){
	 $("#pie").click(function(){
		 $("#test").empty();
		 $.ajax({
			 type:"post",
				url:"${ctx}/test",
		        datatype:"json",
				 success:function(text){
					 var data = text;
					    var xA = [];
					    var yA = [];
				
					    $.each(data,function(i,val){
					    	 xA.push(val.name);
						      yA.push({
						    	  name: val.name,
						    	  value:val.num
						      });
						 });					 
					 var myChart = echarts.init(document.getElementById('test'));
							 var option = {
									 
									    title : {
									        text: '备件出库统计',
									        subtext: '纯属虚构',
									        x:'center'
									    },
									    tooltip : {
									        trigger: 'item',
									        formatter: "{a} <br/>{b} : {c} ({d}%)"
									    },
									    legend: {
									        orient: 'vertical',
									        left: 'left',
									        data: xA
									    },
									    series : [
									        {
									            name: '出库数量',
									            type: 'pie',
									            radius : '55%',
									            center: ['50%', '60%'],
									            data:  yA,
									            itemStyle: {
									                emphasis: {
									                    shadowBlur: 10,
									                    shadowOffsetX: 0,
									                    shadowColor: 'rgba(0, 0, 0, 0.5)'
									                }
									            }
									        }
									    ]
									};

					 myChart.setOption(option);
				 },error:function(){
			    	alert("提示信息");
			    	}
			 });                    
			 
			 
		 });
});
	 