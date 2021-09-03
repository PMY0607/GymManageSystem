<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../app.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <title>financialStatements</title>

    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
    <link href="${appPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="${appPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="${appPath}/js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div class="container">
    <div class="row">
        <h1 class="col-sm-offset-3">运动场所预定总结</h1>
    </div>
    <div class="row">
        <div id="main" class="col-sm-offset-2" style="width: 600px; height: 600px;"></div>
    </div>

</div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    myChart.setOption({
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        series : [
            {
                name: '访问来源',
                type: 'pie',    // 设置图表类型为饼图
                radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                data:[          // 数据数组，name 为数据项名称，value 为数据项值
                    <c:forEach items="${names}" var="name">
                        {value:${map.get(name)}, name:'${name}'},
                    </c:forEach>
                ]
            }
        ]
    })
</script>
</body>
</html>
