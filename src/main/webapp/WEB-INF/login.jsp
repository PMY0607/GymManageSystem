<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="../app.jsp"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <script src="${appPath}/js/vue-2.6.12.js"></script>
    <script src="${appPath}/js/index.js"></script>
    <script src="${appPath}/js/jquery-3.3.1.js"></script>
    <link href="${appPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%--<div id="login"  style="width: 100%; height: 100vh;background-color: #12afa8; overflow: hidden; margin: 0px;padding: 0px">--%>
<div id="login"  style="width: 100%; height: 100vh;background-image: url('/img/bg.jpg'); background-size: 100% 100%; overflow: hidden; margin: 0px;padding: 0px">
    <div style="width: 400px; margin: 100px auto;">
        <div style="color: #cccccc; font-size: 30px; text-align: center; padding: 30px 0">欢迎登录</div>
        <span>${msg}</span>
        <el-form ref="form" id="loginForm"  v-bind:action="reqUrl" method="post" :model="form" size="normal" :rules="rules">
            <el-form-item prop="username">
                <el-input prefix-icon="el-icon-user-solid" name="username" v-model="form.username" placeholder="用户名"></el-input>
            </el-form-item>
            <el-form-item prop="password">
                <el-input prefix-icon="el-icon-lock" show-password name="password"
                          v-model="form.password" @keyup.enter="login" placeholder="密码"></el-input>
            </el-form-item>
            <el-form-item>
                <el-radio v-model="form.role" :label="0" style="color: #eee">会员</el-radio>
                <el-radio v-model="form.role" :label="1" style="color: #eee">管理员</el-radio>
            </el-form-item>
            <el-form-item >
                <div style="display:inline-flex; width: 48%">
                    <el-button style="width: 100%" type="primary" @click="login" >登 录</el-button>
                </div>
                <div style="display:inline-flex; width: 48%; margin: 2px">
                    <a href="/toRegister" style="width: 100%"><el-button style="width: 100%" type="primary">注 册</el-button></a>
                </div>
            </el-form-item>
        </el-form>
    </div>
</div>
<script>

    var login = new Vue({
        el:"#login",
        data:{
            form: {role:1},
            rules: {
                username: [
                    {required: true, message: '请输入用户名', trigger: 'blur'},
                ],
                password: [
                    {required: true, message: '请输入密码', trigger: 'blur'},
                ],
            },
            reqUrl:"admin/login"
        },
        methods: {
            login() {
                if (this.form.role===0){
                    this.reqUrl = "user/login"
                }else{
                    this.reqUrl = "admin/login"
                }
                $("#loginForm").prop("action",this.reqUrl)
                $("#loginForm").submit();
            },
        }
    })
</script>

</body>
</html>