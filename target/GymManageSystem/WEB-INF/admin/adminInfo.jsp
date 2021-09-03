<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../../app.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户信息</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>

    <script src="${appPath}/js/jquery-3.3.1.js"></script>

</head>
<body>
<div class="layui-row ">
    <div class="layui-col-md-offset3 layui-col-md4">
        <div class="layui-panel">
            <div style="padding: 30px;">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>个人信息</legend>
                </fieldset>
                <form class="layui-form" action="/admin/updateMyInfo" enctype="multipart/form-data" method="post" lay-filter="admin">
                    <div class="layui-form-item">
                            <img src="/file/showPic?path=${admin.headPic}" style="border-radius: 50%"  width="135px" height="135px">
                            <div class="caption">
                                <input type="file" name="pic" accept="image/*" />
                            </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" class="layui-input" required  disabled
                                   lay-verify="required" placeholder="用户名" autocomplete="off" value="${admin.username}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" class="layui-input" required
                                   lay-verify="required" placeholder="姓名" autocomplete="off"  value="${admin.name}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">电话</label>
                        <div class="layui-input-block">
                            <input type="tel" name="tel"  class="layui-input" required
                                   lay-verify="required" placeholder="电话" autocomplete="off" value="${admin.tel}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <c:if test="${admin.gender==1}">
                                <input type="radio" name="gender" value="1" title="男" checked>
                                <input type="radio" name="gender" value="0" title="女" >
                            </c:if>
                            <c:if test="${admin.gender==0}">
                                <input type="radio" name="gender" value="1" title="男" >
                                <input type="radio" name="gender" value="0" title="女" checked>
                            </c:if>
                        </div>

                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" class="layui-input" required
                                   lay-verify="required" placeholder="请输入密码" autocomplete="off" value="${admin.password}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" type="submit" id="updateAdmin">保存修改</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
