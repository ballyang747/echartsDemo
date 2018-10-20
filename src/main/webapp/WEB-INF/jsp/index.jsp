<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/china.js"></script>
<script type="text/javascript">

function mixKey(key, values){
	var temp=[];
	temp.push(key);
	for(var i=0;i<values.length;i++){
		temp.push(values[i]) 
	}
	return temp;
}



$(function(){
	$("#map").click(function(){
		 var myChart = echarts.init(document.getElementById('test5'));
         var option = {
             tooltip: {
//                 show: false //不显示提示标签
                 formatter: '{b}', //提示标签格式
                 backgroundColor:"#ff7f50",//提示标签背景颜色
                 textStyle:{color:"#fff"} //提示标签字体颜色
             },
             series: [{
                 type: 'map',
                 mapType: 'china',
                 label: {
                     normal: {
                         show: true,//显示省份标签
                         textStyle:{color:"#c71585"}//省份标签字体颜色
                     },    
                     emphasis: {//对应的鼠标悬浮效果
                         show: true,
                         textStyle:{color:"#800080"}
                     } 
                 },
                 itemStyle: {
                     normal: {
                         borderWidth: .5,//区域边框宽度
                         borderColor: '#009fe8',//区域边框颜色
                         areaColor:"#ffefd5",//区域颜色
                     },
                     emphasis: {
                         borderWidth: .5,
                         borderColor: '#4b0082',
                         areaColor:"#ffdead",
                     }
                 },
                 data:[
                     {name:'福建', selected:true}//福建为选中状态
                 ]
             }],
         };
         
         myChart.setOption(option);
         myChart.on('mouseover', function (params) {
             var dataIndex = params.dataIndex;
             console.log(params);
         });
		
	});
	
	
	
	
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
					    var years=[];
					    var datas=[];
					    var series=[];
					    $.each(data,function(i,val){
					    	 xA.push(i);
					    	 yA.push(val)
						 });			
					    console.log(yA);
					    $.each(yA,function(i,value){
					    	var temp = [];
					    	var temp2=[];
					    	var nums= value
						    $.each(nums,function(i,val){
						    	temp.push(val.num);
						    	temp2.push(val.year);
							 }); 
					    	years.push(temp2);
					    	datas.push(temp);
						 });
					    //xA and datas 
					    //years[1]
					    
					    for(var i= 0;i<datas.length;i++){
					    	　　series.push({
					    	　　　　name:xA[i],
					    	　　　　 type: 'bar',
						                  label: labelOption,
						                 data: datas[i]
					    	　　})
					    	}
			
					     console.log(years[1]);
					    console.log(datas);
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
						        data: xA
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
						            data: years[1]
						        }
						    ],
						    yAxis: [
						        {
						            type: 'value'
						        }
						    ],
						    series:series
						};
					 
					 
					 

					 myChart.setOption(option);
				 },error:function(){
			    	alert("提示信息");
			    	}
			 });                    
			 
			 
		 });
	
	 $("#update").click(function(){
			
		 $.ajax({
			 type:"post",
				url:"${ctx}/test3",
		        datatype:"json",
				 success:function(text){
					 var datas = text;
					    var xA = [];
					    var yA = [];
					    var data=[]; 
					    var xData=[];
					    var yData=[];
					    $.each(datas,function(i,val){
					    	 xA.push(val.recordDate);
						        yA.push(val.num);
						 });					
					    
					    console.log(xA);
					    console.log(yA);
					    var now =  xA[0];
					    
					    for (var i = 0; i < 100; i++) {
					    	xData.push(xA[i]);
					    	yData.push(yA[i]);
					    }
					    
					    console.log(data);
					    var temp = 100;
					    function addData(shift){
					    	xData.shift();
					    	yData.shift();
					    	xData.push(xA[temp]);
					    	yData.push(yA[temp]);
					    	temp ++;
					    }
					 
					 

	
					 var myChart = echarts.init(document.getElementById('test3'));
					 var option = {
					     xAxis: {
					         type: 'category',
					         boundaryGap: false,
					         data: xData
					     },
					     yAxis: {
					         boundaryGap: [0, '50%'],
					         type: 'value'
					     },
					     series: [
					         {
					             name:'备件出库数量',
					             type:'line',
					             smooth:true,
					             symbol: 'none',
					             stack: 'a',
					             areaStyle: {
					                 normal: {}
					             },
					             data: yData
					         }
					     ]
					 };
					 setInterval(function () {
						 addData(true);
					     myChart.setOption({
					         xAxis: {
					             data: xData
					         },
					         series: [{
					             name:'出库数量',
					             data: yData
					         }]
					     });
					 }, 500);
					 myChart.setOption(option);
				 },error:function(){
			    	alert("提示信息");
			    	}
			 });                    
			 
			 
		 });
	 $("#multi2").click(function(){ 
		 var year = [];
		
		 var xYear=[];
		 
		 $.ajax({
			 type:"post",
				url:"${ctx}/test2",
		        datatype:"json",
				 success:function(text){
					 var data = text;
					    var xA = [];//第一列
					    var cat=[];
					    var yA = [];
					    var years=[];
					    var datas=[];
					   var series =[];
					    $.each(data,function(i,val){
					    	 xA.push(i);
					    	 yA.push(val)
						 });
					    var year = mixKey("年份",xA);
				
					    $.each(yA,function(i,value){
					    	var temp = [];
					    	var temp2=[];
					    	var nums= value
						    $.each(nums,function(i,val){
						    	temp.push(val.num);
						    	temp2.push(val.year);
							 }); 
					    	years.push(temp2);
					    	datas.push(temp);
						 });
					    
					    year = mixKey("year",years[1]);
					    xYear=years[1];
					    console.log(year);
					    
			   for(var i= 0;i<datas.length;i++){
				   series.push(mixKey(xA[i],datas[i]))
			   } 
			   dataz = mixKey(year,series);
			   console.log(dataz);
				 setTimeout(function () {
					  
					 var myChart = echarts.init(document.getElementById('test4'));
					    option = {
					        legend: {},
					        tooltip: {
					            trigger: 'axis',
					            showContent: false
					        },
					        dataset: {
					        	
					            source: dataz

					        },
					        xAxis: {type: 'category'},
					        yAxis: {gridIndex: 0},
					        grid: {top: '55%'},
					        series: [
					            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
					            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
					            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
					            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
					            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
					            {type: 'line', smooth: true, seriesLayoutBy: 'row'},
					            {
					                type: 'pie',
					                id: 'pie',
					                radius: '30%',
					                center: ['50%', '25%'],
					                label: {
					                    formatter: '{b}: {@'+xYear[0]+'} ({d}%)'
					                },
					                encode: {
					                    itemName: 'year',
					                    value: xYear[0],
					                    tooltip: xYear[0]
					                }
					            }
					        ]
					    };

					    myChart.on('updateAxisPointer', function (event) {
					        var xAxisInfo = event.axesInfo[0];
					        if (xAxisInfo) {
					            var dimension = xAxisInfo.value + 1;
					            myChart.setOption({
					                series: {
					                    id: 'pie',
					                    label: {
					                        formatter: '{b}: {@[' + dimension + ']} ({d}%)'
					                    },
					                    encode: {
					                        value: dimension,
					                        tooltip: dimension
					                    }
					                }
					            });
					        }
					    });

					    myChart.setOption(option);

					});
			
				
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
      <button value="test"  id="update"> 更新图</button>
      <button value="test"  id="multi2"> 多状态图2</button>
          <button value="test"  id="map"> 地图</button>
 <div id="test" style="width: 600px;height:400px;">

 </div>
  <div id="test1" style="width: 600px;height:400px;" style="float: left;">

 </div>
   <div id="test2" style="width: 600px;height:400px;" style="float: left;">

 </div>
    <div id="test3" style="width: 600px;height:400px;" style="float: left;">

 </div>
 <div id="test4" style="width: 600px;height:400px;" style="float: left;">

 </div>
 <div id="test5" style="width: 600px;height:400px;" style="float: left;">

 </div>
</body>
</html>