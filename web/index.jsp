<%--
  Created by IntelliJ IDEA.
  User: 17782
  Date: 2020/3/11
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ECharts</title>
    <script src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
    <script src="js/echarts.js"></script>
    <script src="js/china.js"></script>
    <style>#china-map {width:1000px; height: 1000px;margin: auto;}</style>
</head>
<body>
<div id="china-map"></div>
<script>
    var myChart = echarts.init(document.getElementById('china-map'));
    var option = {
        title : {
            text: '全国疫情地图',
            x:'center'
        },
        tooltip : {//提示框组件。
            trigger: 'item',//数据项图形触发，主要在散点图，饼图等无类目轴的图表中使用。
            formatter:'{a}<br>地区:{b}<br>确诊:{c}人'
        },
        legend: {
            orient: 'horizontal',//图例的排列方向
            x:'left',//图例的位置
            data:['患者']
        },

        visualMap: {//颜色的设置  dataRange
            x: 'left',
            y: 'center',
            splitList: [
                {start: 10000},
                {start: 1000, end: 9999},
                {start: 100, end: 999},
                {start: 10, end: 99},
                {start: 1, end: 9},
                {start:0, end: 0}
            ],
//            min: 0,
//            max: 2500,
 //           calculable : true,//颜色呈条状
        },
        toolbox: {//工具栏
            show: true,
            orient : 'vertical',//工具栏 icon 的布局朝向
            x: 'right',
            y: 'center',
            feature : {//各工具配置项。
                mark : {show: true},
                dataView : {show: true, readOnly: false},//数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新。
                restore : {show: true},//配置项还原。
                saveAsImage : {show: true}//保存为图片。
            }
        },
        roamController: {//控制地图的上下左右放大缩小 图上没有显示
            show: true,
            x: 'right',
            mapTypeControl: {
                'china': true
            }
        },
        series : [
            {
                name: '地区状况',
                type: 'map',
                mapType: 'china',
                roam: false,//是否开启鼠标缩放和平移漫游
                itemStyle:{//地图区域的多边形 图形样式
                    normal:{//是图形在默认状态下的样式
                        label:{
                            show:true,//是否显示标签
                            textStyle: {
                                color: "rgb(249, 249, 249)"
                            }
                        }
                    },
                    emphasis:{//是图形在高亮状态下的样式,比如在鼠标悬浮或者图例联动高亮时
                        label:{show:true}
                    }
                },
                top:"3%",//组件距离容器的距离
                data:[
                    {name: '北京',value: Math.round(Math.random()*15000)},
                    {name: '天津',value: Math.round(Math.random()*15000)},
                    {name: '上海',value: Math.round(Math.random()*15000)},
                    {name: '重庆',value: Math.round(Math.random()*15000)},
                    {name: '河北',value: 0},
                    {name: '河南',value: Math.round(Math.random()*15000)},
                    {name: '云南',value: 5},
                    {name: '辽宁',value: 305},
                    {name: '黑龙江',value: Math.round(Math.random()*15000)},
                    {name: '湖南',value: 200},
                    {name: '安徽',value: Math.round(Math.random()*15000)},
                    {name: '山东',value: Math.round(Math.random()*15000)},
                    {name: '新疆',value: Math.round(Math.random()*15000)},
                    {name: '江苏',value: Math.round(Math.random()*15000)},
                    {name: '浙江',value: Math.round(Math.random()*15000)},
                    {name: '江西',value: Math.round(Math.random()*15000)},
                    {name: '湖北',value: Math.round(Math.random()*15000)},
                    {name: '广西',value: Math.round(Math.random()*15000)},
                    {name: '甘肃',value: Math.round(Math.random()*15000)},
                    {name: '山西',value: Math.round(Math.random()*15000)},
                    {name: '内蒙古',value: Math.round(Math.random()*15000)},
                    {name: '陕西',value: Math.round(Math.random()*15000)},
                    {name: '吉林',value: Math.round(Math.random()*15000)},
                    {name: '福建',value: Math.round(Math.random()*15000)},
                    {name: '贵州',value: Math.round(Math.random()*15000)},
                    {name: '广东',value: Math.round(Math.random()*15000)},
                    {name: '青海',value: Math.round(Math.random()*15000)},
                    {name: '西藏',value: Math.round(Math.random()*15000)},
                    {name: '四川',value: Math.round(Math.random()*15000)},
                    {name: '宁夏',value: Math.round(Math.random()*15000)},
                    {name: '海南',value: Math.round(Math.random()*15000)},
                    {name: '台湾',value: Math.round(Math.random()*15000)},
                    {name: '香港',value: Math.round(Math.random()*15000)},
                    {name: '澳门',value: Math.round(Math.random()*15000)}
                ]
            }
        ]
    };
    myChart.setOption(option);
    myChart.on('mouseover', function (params) {
        var dataIndex = params.dataIndex;
        console.log(params);
    });
</script>
</body>
</html>

