<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../../app.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>体育场预约系统</title>
    <link rel="stylesheet" href="${appPath}/layui/css/layui.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black"> <span style="color: rgb(0,150,136)"> 体育场预约系统</span></div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="/file/showPic?path=${user.headPic}" class="layui-nav-img">
                    <c:if test="${user.name!=null}">
                        ${user.name}
                    </c:if>
                    <c:if test="${user.name==null}">
                        ${user.username}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="/user/myInfo" target="container">个人信息</a></dd>
                    <dd><a href="/book/userBookInfo" target="container">我的预约</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a  href="/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="/book/showPlace" target="container">场地预定</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe name="container" src="/book/showPlace" width="100%" height="100%"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <!-- 底部固定区域 -->
        2021 &copy;
        <a href="https://user.qzone.qq.com/1438617535/main/">pmy的qq空间/</a> MIT license
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