<%--
  Created by IntelliJ IDEA.
  User: 17782
  Date: 2020/3/12
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="log.getlog" %>
<%@ page import="province.Province" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta charset="utf-8">
    <title>省份日期折线图</title>
    <script src="js/echarts.js"></script>
    <style>body{text-align:center}</style>
    <style>#chart1{ width:1000px; height: 400px;margin: auto;}</style>
    <style>#chart2 {width:1000px; height: 400px;margin: auto;}</style>
</head>
<body>
<%
    int ip,sp,cure,dead;
    String pro = request.getParameter("province");
    List<String> date = getlog.getAllFileName();//得到日志文件名，即日期
    Province provinces = getlog.log(pro,null);//输入省份名字和日期得到该日期该省的数据
    ip = provinces.getIp();
    sp = provinces.getSp();
    cure = provinces.getCure();
    dead = provinces.getDead();
%>
<div id = "chart2"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('chart2'));
    var option = {
        title: {
            text:'<%=pro%>省份数据'
        },
        tooltip: {},
        legend: {
            data:['人数']
        },
        xAxis: {
            data: ["确诊患者","疑似患者","治愈人数","死亡人数"]
        },
        yAxis: {},
        series: [{
            name: '人数',
            type: 'bar',
            data: [<%=ip%>,<%=sp%>,<%=cure%>,<%=dead%>,]
        }]
    };
    myChart.setOption(option);
</script>
<div id = "chart1"></div>
<script type = "text/javascript">
    //指定图标的配置和数据
    var option = {
        title:{
            text:'折线图'
        },
        tooltip : {//提示框组件。
            trigger: 'item',
            formatter:'{a}<br>时间:{b}<br>确诊:{c}人'
        },
        legend:{},
        xAxis:{
            data:[
                 <% for(String Date : date){ %>
                 "<%=Date%>",
                <% } %>
                 ]
        },
        yAxis:{
        },
        series:[{
            name:'<%=pro%>地区确诊人数',
            type:'line',
            data:[
                <% for(String Date : date){ %>
                "<%=getlog.log(pro,Date).getIp()%>",
                <% } %>
            ]
        }]
    };
    var myChart = echarts.init(document.getElementById('chart1'));
    myChart.setOption(option);
</script>
</body>
</html>
