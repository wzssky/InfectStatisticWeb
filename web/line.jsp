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
    <title>折线图</title>
    <script src="js/echarts.js"></script>
    <style>#main {width:1000px; height: 1000px;margin: auto;}</style>
</head>
<body>
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    <%
    int ip,sp,cure,dead;
    String pro = request.getParameter("province");
    Province provinces = getlog.log(pro,null);
    ip = provinces.getIp();
    sp = provinces.getSp();
    cure = provinces.getCure();
    dead = provinces.getDead();
%>
    var myChart = echarts.init(document.getElementById('main'));
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
</body>
</html>
