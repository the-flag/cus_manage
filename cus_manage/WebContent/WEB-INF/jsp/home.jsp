<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/default/easyui.css"/>
    <link type="text/css" rel="stylesheet" href="js/jquery-easyui-1.5.3/themes/icon.css"/>
    <link type="text/css" rel="stylesheet" href="js/css/main.css">
	<script src="js/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script src="js/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script src="js/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	$(function(){
		alert("提示");
		alert(${m.roles[0].role_id});
		var role_id=${m.roles[0].role_id};
		if(role_id==3){ //是咨询师
			//数据一
			$("#dataCouont1").text();
			$("#dataSpan1").text();
			$("#dataTitle1").text("待办未处理");
			//数据二
			$("#dataCouont2").text();
			$("#dataSpan2").text();
			$("#dataTitle2").text("客户数量");
			//数据三
			$("#dataCouont3").text();
			$("#dataSpan3").text();
			$("#dataTitle3").text("新客户");
			//数据四
			$("#dataCouont4").text();
			$("#dataSpan4").text();
			$("#dataTitle4").text("当月打卡");
		}
	})
			
</script>
</head>
<body>
<div class="allBox">
<div class="homeLeft01">
    <a href="#" class="homeUpaBox">
        <div class="aLeft"><img src="img/computer.png"/> </div>
        <div class="aRight">
            <p class="fontSizeBig" style="margin-top: 10px" id="dataCouont1">14<span class="fontSizeMin" id="dataSpan1">个</span></p>
            <p class="fontSizeMin" id="dataTitle1">待分配客户</p>
        </div>
    </a>
   <a href="#" class="homeUpaBule">
    <div class="aLeft"><img src="img/computer.png"/> </div>
    <div class="aRight">
        <p class="fontSizeBig" style="margin-top: 10px" id="dataCouont2">14<span class="fontSizeMin" id="dataSpan2">个</span></p>
        <p class="fontSizeMin" id="dataTitle2">咨询师人数</p>
    </div>
    </a>
</div>
    <div class="homeLeft01">
        <a href="#" class="homeUpaBule03">
            <div class="aLeft"><img src="img/computer.png"/> </div>
            <div class="aRight">
                <p class="fontSizeBig" style="margin-top: 10px" id="dataCouont3">14<span class="fontSizeMin" id="dataSpan3">个</span></p>
                <p class="fontSizeMin" id="dataTitle3">客户人数</p>
            </div>
        </a>
        <a href="#" class="homeUpaBule04">
            <div class="aLeft"><img src="img/computer.png"/> </div>
            <div class="aRight">
                <p class="fontSizeBig" style="margin-top: 10px">……<span class="fontSizeMin" id="dataSpan4"></span></p>
                <p class="fontSizeMin" id="dataTitle4">未指定</p>
            </div>
        </a>
    </div>
    <div id="calder" class="homeLeft02"></div>
    <div class="homeLeft03">
        <h5 class="hStyle"><span>通知公告</span><a href="#">更多</a> </h5>
        <ul class="orderUl" id="notic">
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
        </ul>
    </div>
    <div class="clear"></div>
    <div class="homeLeft04">
        <h5 class="hStyle"><span>风险分析</span></h5>
        <p class="stataAny" id="chart01"></p>
    </div>
    <div class="homeLeft04">
        <h5 class="hStyle"><span>交货分析</span></h5>
        <p class="stataAny" id="chart02"></p>
    </div>
    <div class="homeLeft03" style="margin-top: 5px">
        <h5 class="hStyle"><span>公开底价</span><a href="#">更多</a> </h5>
        <ul class="orderUl">
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
        </ul>
    </div>
    <div class="clear"></div>
    <div class="homeLeft05">
    	
        <h5 class="hStyle"><span>交货分析</span></h5>
        <p class="stataAny" style="height: 220px" id="chart03"></p>
    </div>
    <div class="homeLeft06" id="rightTab">
        <div title="待办信息" style="display:none;">
            <ul class="orderUl">
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            </ul>
            <p class="tabConP"><a href="#">更多</a> </p>
        </div>
        <div title="已办信息"  style="overflow:auto;display:none;">
            <ul class="orderUl">
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            </ul>
            <p class="tabConP"><a href="#">更多</a> </p>
        </div>
    </div>
    <div class="clear"></div>

</div>
<script src="js/echarts/echarts-all.js"></script>
<script src="js/home.js"></script>
<script type="text/javascript">
	$(function(){
		/* 饼图一 */
			$.post("selectCustomerByJiaotimeAndCount",{
			},function(data){
				 var myChart = echarts.init($("#chart03")[0]);
				//app.title = '堆叠柱状图';

				        option = {
				                tooltip : {
				                        trigger: 'axis',
				                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				                                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				                        }
				                }, 
				                legend: {
				                        data:['成交量']
				                }, 
				                grid: {
				                        left: '3%',
				                        right: '4%',
				                        bottom: '3%',
				                        containLabel: true
				                },
				                xAxis : [
				                        {
				                                type : 'category',
				                                data : data.categories
				                        }
				                ],
				                yAxis : [
				                        {
				                                type : 'value'
				                        }
				                ],
				                series : [
				                        {
				                                name:'成交量',
				                                type:'bar',
				                                data:data.data
				                        }
				                ]
				        };
				        myChart.setOption(option);
			},"json")        
		
	})
</script>
</body>
</body>
</html>