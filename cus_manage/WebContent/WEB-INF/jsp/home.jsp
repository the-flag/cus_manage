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
	/* $(function(){
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
	}) */

			
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
        </ul>
    </div>
    <div class="clear"></div>
    <div class="homeLeft04" id="chart01">
        <!-- <h5 class="hStyle"><span>风险分析</span></h5>
        <p class="stataAny" ></p> -->
    </div>
    <div class="homeLeft04" id="chart02">
        <!-- <h5 class="hStyle"><span>交货分析</span></h5>
        <p class="stataAny" ></p> -->
    </div>
    <div class="homeLeft03" style="margin-top: 5px">
        <h5 class="hStyle"><span>公开底价</span><a href="#">更多</a> </h5>
        <ul class="orderUl">
            <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
        </ul>
    </div>
    <div class="clear"></div>
    <div class="homeLeft05" id="chart03" style="height: 220px">
    	
        <!-- <h5 class="hStyle"><span>交货分析</span></h5>
        <p class="stataAny"  ></p> -->
    </div>
    <div class="homeLeft06" id="rightTab">
        <div title="待办信息" style="display:none;">
            <ul class="orderUl">
                <li><a href="#">2017年中国最具有竞争力的手机厂商</a><span>05-13</span> </li>
            </ul>
            <p class="tabConP"><a href="#">更多</a> </p>
        </div>
        <div title="已办信息"  style="overflow:auto;display:none;">
            <ul class="orderUl">
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
/**
 * 饼图1
 */
$(function(){
	$.post("selectCustomerAndUserCount",{
	},function(data){
	    var myChart = echarts.init($("#chart01")[0]);
	
	    option = {
	
	            tooltip : {
	                    trigger: 'item',
	                    formatter: "{a} <br/>{b} : {c} ({d}%)"
	            },
	            legend: {
	
	                    left: 'left',
	                    data: ['客户比例']
	            },
	            series : [
	                    {
	                            name: '客户比例',
	                            type: 'pie',
	                            radius : '55%',
	                            center: ['50%', '60%'],
	                            data:data,
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
	},"json")  
});

/**
 * 饼图2
 */
$(function(){
	$.post("selectUserByUserLoginTime",{
	},function(data){
		alert(data.selected["签到"]);
	    var myChart = echarts.init($("#chart02")[0]);
	    
	    option = {
	        tooltip : {
	            trigger: 'item',
	            formatter: "{a} <br/>{b} : {c} ({d}%)"
	        },
	        legend: {
	            
	            right: 20,
	            top: 20,
	            bottom: 20,
	            data: data.legendData,
	            selected:data.selected
	        },
	        series : [
	            {
	                name: '姓名',
	                type: 'pie',
	                radius : '55%',
	                center: ['40%', '50%'],
	                data: data.seriesData,
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


	    function genData(count) {
	        var nameList = [
	            '赵', '钱', '孙', '李', '周', '吴', '郑', '王', '冯', '陈', '褚', '卫', '蒋', '沈', '韩', '杨', '朱', '秦', '尤', '许', '何', '吕', '施', '张', '孔', '曹', '严', '华', '金', '魏', '陶', '姜', '戚', '谢', '邹', '喻', '柏', '水', '窦', '章', '云', '苏', '潘', '葛', '奚', '范', '彭', '郎', '鲁', '韦', '昌', '马', '苗', '凤', '花', '方', '俞', '任', '袁', '柳', '酆', '鲍', '史', '唐', '费', '廉', '岑', '薛', '雷', '贺', '倪', '汤', '滕', '殷', '罗', '毕', '郝', '邬', '安', '常', '乐', '于', '时', '傅', '皮', '卞', '齐', '康', '伍', '余', '元', '卜', '顾', '孟', '平', '黄', '和', '穆', '萧', '尹', '姚', '邵', '湛', '汪', '祁', '毛', '禹', '狄', '米', '贝', '明', '臧', '计', '伏', '成', '戴', '谈', '宋', '茅', '庞', '熊', '纪', '舒', '屈', '项', '祝', '董', '梁', '杜', '阮', '蓝', '闵', '席', '季', '麻', '强', '贾', '路', '娄', '危'
	        ];
	        var legendData = [];
	        var seriesData = [];
	        var selected = {};
	        for (var i = 0; i < 5; i++) {
	            name = Math.random() > 0.65
	                ? makeWord(4, 1) + '·' + makeWord(3, 0)
	                : makeWord(2, 1);
	            legendData.push(name);
	            seriesData.push({
	                name: name,
	                value: Math.round(Math.random() * 100000)
	            });
	            selected[name] = i < 6;
	        }

	        return {
	            legendData: legendData,
	            seriesData: seriesData,
	            selected: selected
	        };

	        function makeWord(max, min) {
	            var nameLen = Math.ceil(Math.random() * max + min);
	            var name = [];
	            for (var i = 0; i < nameLen; i++) {
	                name.push(nameList[Math.round(Math.random() * nameList.length - 1)]);
	            }
	            return name.join('');
	        }
	    }

	    myChart.setOption(option);
	},"json")  
});

	$(function(){
		/* 条形图 */
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
				                        data:['近六月个成交量']
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
				                                name:'近六月个成交量',
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