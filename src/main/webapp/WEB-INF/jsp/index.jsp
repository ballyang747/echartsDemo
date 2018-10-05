<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#zhuzi").click(function(){
	
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
			 
			 
		 });
	 
	 $("#pie").click(function(){
		
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
					 var myChart = echarts.init(document.getElementById('test1'));
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
	 
	 $("#multi").click(function(){
			
		 $.ajax({
			 type:"post",
				url:"${ctx}/test2",
		        datatype:"json",
				 success:function(text){
					 var data = text;
					    var xA = [];
					    var yA = [];
					    
					    $.each(data,function(i,val){
					    	 xA.push(i);
						 });					 
					 var myChart = echarts.init(document.getElementById('test2'));
					 var posList = [
						    'left', 'right', 'top', 'bottom',
						    'inside',
						    'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
						    'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
						];

					 myChart.configParameters = {
						    rotate: {
						        min: -90,
						        max: 90
						    },
						    align: {
						        options: {
						            left: 'left',
						            center: 'center',
						            right: 'right'
						        }
						    },
						    verticalAlign: {
						        options: {
						            top: 'top',
						            middle: 'middle',
						            bottom: 'bottom'
						        }
						    },
						    position: {
						        options: echarts.util.reduce(posList, function (map, pos) {
						            map[pos] = pos;
						            return map;
						        }, {})
						    },
						    distance: {
						        min: 0,
						        max: 100
						    }
						};

					 myChart.config = {
						    rotate: 90,
						    align: 'left',
						    verticalAlign: 'middle',
						    position: 'insideBottom',
						    distance: 15,
						    onChange: function () {
						        var labelOption = {
						            normal: {
						                rotate: app.config.rotate,
						                align: app.config.align,
						                verticalAlign: app.config.verticalAlign,
						                position: app.config.position,
						                distance: app.config.distance
						            }
						        };
						        myChart.setOption({
						            series: [{
						                label: labelOption
						            }, {
						                label: labelOption
						            }, {
						                label: labelOption
						            }, {
						                label: labelOption
						            }]
						        });
						    }
						};


						var labelOption = {
						    normal: {
						        show: true,
						        position: myChart.config.position,
						        distance: myChart.config.distance,
						        align: myChart.config.align,
						        verticalAlign: myChart.config.verticalAlign,
						        rotate: myChart.config.rotate,
						        formatter: '{c}  {name|{a}}',
						        fontSize: 16,
						        rich: {
						            name: {
						                textBorderColor: '#fff'
						            }
						        }
						    }
						};

						var option = {
						    color: ['#003366', '#006699', '#4cabce', '#e5323e'],
						    tooltip: {
						        trigger: 'axis',
						        axisPointer: {
						            type: 'shadow'
						        }
						    },
						    legend: {
						        data: ['Forest', 'Steppe', 'Desert', 'Wetland']
						    },
						 /*    toolbox: {
						        show: true,
						        orient: 'vertical',
						        left: 'right',
						        top: 'center',
						        feature: {
						            mark: {show: true},
						            dataView: {show: true, readOnly: false},
						            magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
						            restore: {show: true},
						            saveAsImage: {show: true}
						        }
						    } ,*/
						    calculable: true,
						    xAxis: [
						        {
						            type: 'category',
						            axisTick: {show: false},
						            data: xA
						        }
						    ],
						    yAxis: [
						        {
						            type: 'value'
						        }
						    ],
						    series: [
						        {
						            name: 'Forest',
						            type: 'bar',
						            barGap: 0,
						            label: labelOption,
						            data: [320, 332, 301, 334, 390]
						        },
						        {
						            name: 'Steppe',
						            type: 'bar',
						            label: labelOption,
						            data: [220, 182, 191, 234, 290]
						        },
						        {
						            name: 'Desert',
						            type: 'bar',
						            label: labelOption,
						            data: [150, 232, 201, 154, 190]
						        },
						        {
						            name: 'Wetland',
						            type: 'bar',
						            label: labelOption,
						            data: [98, 77, 101, 99, 40]
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

</script>

 

</head>
<body>
 <h1>图标测试</h1>
 
 <button value="test"  id="zhuzi"> 柱状图</button>
  <button value="test"  id="pie"> 饼图</button>
   <button value="test"  id="multi"> 多状态图</button>
 <div id="test" style="width: 600px;height:400px;">

 </div>
  <div id="test1" style="width: 600px;height:400px;" style="float: left;">

 </div>
   <div id="test2" style="width: 600px;height:400px;" style="float: left;">

 </div>
</body>
</html>