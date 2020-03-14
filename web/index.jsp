<%--
  Created by IntelliJ IDEA.
  User: 17782
  Date: 2020/3/11
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="log.getlog" %>
<%@ page import="province.Province" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>ECharts</title>
    <script src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
    <script src="js/echarts.js"></script>
    <script src="js/china.js"></script>
    <style>#china-map { width:1000px; height: 1000px;margin: auto;}</style>
    <style>#row{ background-color: white; height: 30px ;margin: auto;}</style>
    <style>#Table { width:1000px; height: 150px;margin: auto;text-align:center;}</style>
    <style>.size1{font-size: 20px;font-weight: bolder}</style>
    <style>.size2{font-size: 25px;font-weight: bolder}</style>
    <style>.size3{font-size: 15px;font-weight: bolder}</style>
    <style>body { text-align:center}</style>
</head>
<body>
<%
    String date = null;
    int ip = 0,sp = 0,cure = 0,dead = 0;
    String ipresult = null,spresult = null,cureresult = null,deadresult = null;
    date = request.getParameter("date");
<<<<<<< HEAD
    List<Province> provinces = getlog.log(date);//输入日期返回当前日期的省份列表数据
    List<Province> provinceYes = getlog.logYesterday(date);//输入日期返回前一天的省份列表数据
    for(Province province : provinces)
    {
        if(province.getProvince().equals("全国"))
        {
            ip = province.getIp();
            sp = province.getSp();
            cure = province.getCure();
            dead = province.getDead();
        }
    }
        for(Province province : provinceYes)
    {
        if(province.getProvince().equals("全国"))
        {
            if((ip - province.getIp())>0) ipresult = "+"+((ip - province.getIp())+"");
            else if((ip - province.getIp())==0) ipresult = "无变化";
            else ipresult = (ip - province.getIp())+"";
            if((sp - province.getSp())>0) spresult = "+"+((sp - province.getSp())+"");
            else if((sp - province.getSp())==0) spresult = "无变化";
            else spresult = (sp - province.getSp())+"";
            if((cure - province.getCure())>0) cureresult = "+"+((cure - province.getCure())+"");
            else if((cure - province.getCure())==0) cureresult = "无变化";
            else cureresult = (cure - province.getCure())+"";
            if((dead - province.getDead())>0) deadresult = "+"+((dead - province.getDead())+"");
            else if((dead - province.getDead())==0) deadresult = "无变化";
            else deadresult = (dead - province.getDead())+"";
        }
    }
=======
    List<Province> provinces = getlog.log(date);//输入日期返回当前日期的省份列表的相关数据
>>>>>>> f4d47d29505967076a370a17727503ff2d1afb5f
%>
<div id = "row">
     日期
    <input type="text" name="time" id="time" placeholder="yyyy-MM-dd">
    <input type="button" value="查询" onclick="date()">
</div>
<table id = "Table">
    <tr class = "size1">
        <th>现有确诊</th>
        <th>现有疑似</th>
        <th>累计治愈</th>
    </tr>
    <tr>
        <td><p class = "size2" style="color: red"><%=ip%></p><p class = "size3">较昨日<%=ipresult%></p></td>
        <td><p class="size2" style="color: orange"><%=sp%></p><p class = "size3">较昨日<%=spresult%></p></td>
        <td><p class="size2" style="color: lawngreen"><%=cure%></p><p class = "size3">较昨日<%=cureresult%></p></td>
    </tr>
    <tr class = "size1">
        <th>累计确诊</th>
        <th>累计死亡</th>
    </tr>
    <tr class = "size2">
        <td><p style="color: darkred"><%=ip+dead+cure%></p></td>
        <td><p style="color: black"><%=dead%><p></td>
    </tr>
</table>
<div id = "china-map"></div>
<script>
    function date() {
        var content = document.getElementById("time");//input的id
        $("time").val();
        window.alert(content.value);
        window.location.href = "index.jsp?&date="+content.value;
    }
    var myChart = echarts.init(document.getElementById('china-map'));
    var option = {
        title : {
            text: '全国疫情地图',
            x:'center'
        },
        tooltip : {//提示框组件
            trigger: 'item',//数据项图形触发，主要在散点图，饼图等无类目轴的图表中使用
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
                {start: 0, end: 0}
            ],
        },
        toolbox: {//工具栏
            show: true,
            orient : 'vertical',//工具栏 icon 的布局朝向
            x: 'right',
            y: 'center',
            feature : {//各工具配置项
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
                    <%
                        for(Province province : provinces)
                        {
                            if(!province.getProvince().equals("全国"))
                            {
                    %>
                    {name:'<%=province.getProvince()%>', value: <%=province.getIp()%>},
                    <%}}%>
                ]
            }
        ]
    };
    myChart.setOption(option);
    myChart.on('click', function (params){
        var name = params.name;
        location.href = "line.jsp?&province="+name;
    });
</script>
</body>
</html>

