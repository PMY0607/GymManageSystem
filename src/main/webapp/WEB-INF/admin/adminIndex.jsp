<% Admin admin = (Admin) session.getAttribute("admin"); %>
<%@ page import="com.pmy.pojo.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../app.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>adminIndex</title>
    <link rel="stylesheet" href="${appPath}/layui/css/layui.css">
    <script src="${appPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="text-align: center">
        <div class="layui-logo layui-hide-xs layui-bg-black">体育场预约系统</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="/file/showPic?path=${admin.headPic}" class="layui-nav-img">
                    <c:if test="${admin.name!=null}">
                        ${admin.name}
                    </c:if>
                    <c:if test="${admin.name==null}">
                        ${admin.username}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/admin/myInfo" target="container">个人信息</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-unselect>
                <a href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll" style="text-align: center">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">场地管理</a>
                    <dl class="layui-nav-child">
                        <%--<dd><a href="javascript:;">场地开单</a></dd>
                        <dd><a href="javascript:;">场地结账</a></dd>--%>
                        <dd><a href="/book/bookInfoList" target="container">预约管理</a></dd>
                        <dd>
                            <a href="/place/showPlace" target="container">查看场地</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">会员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/user/toUserList" target="container">会员查询</a></dd>
                       <%-- <dd><a href="javascript:;">收银员查询</a></dd>--%>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">财务信息</a>
                    <dl class="layui-nav-child">
<%--                        <dd><a href="javascript:;">财务总结</a></dd>--%>
                        <dd><a href="/book/getBookCountBySportType" target="container">财务报表</a></dd>
                    </dl>
                </li>
                <%--<li class="layui-nav-item">
                    <a href="javascript:;"
                       data-options="{url:'view/app.html',icon:'&#xe658;',title:'查看场地',id:'9'}">
                        <i class="layui-icon">&#xe658;</i><span> 查看场地</span></a>
                </li>--%>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe name="container" width="100%" height="100%"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>
<script src="${appPath}/layui/layui.js"></script>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });

    });

</script>
</body>
</html>