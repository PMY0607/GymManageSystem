<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>register</title>
    <script src="../js/vue-2.6.12.js" type="text/javascript"></script>
    <script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="../js/index.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/index.css">
</head>
<body>

    <div id="register" style="width: 100%; height: 100vh;background-image: url('/img/bg.jpg'); background-size: 100% 100%; overflow: hidden">
        <div style="width: 400px; margin: 100px auto">
            <div style="color: #cccccc; font-size: 30px; text-align: center; padding: 30px 0">注册账户</div>
            <span>${msg}</span>
            <el-form ref="form" id="registerForm" v-bind:action="reqUrl" :model="form" size="normal" :rules="rules">
                <el-form-item prop="username">
                    <el-input prefix-icon="el-icon-user-solid" name="username" v-model="form.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password">
                    <el-input prefix-icon="el-icon-lock" name="password" v-model="form.password" show-password placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item prop="confirm">
                    <el-input prefix-icon="el-icon-lock" v-model="form.confirm"  @keyup.enter="register"
                              show-password placeholder="请确认密码"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-radio v-model="form.role" :label="0" style="color: #eee">会员</el-radio>
                    <el-radio v-model="form.role" :label="1" style="color: #eee">管理员</el-radio>
                </el-form-item>
                <el-form-item>
                    <div style="display:inline-flex; width: 48%">
                        <el-button style="width: 100%" type="primary" @click="register">注册</el-button>
                    </div>
                    <div style="display:inline-flex; width: 48%; margin: 2px">
                        <a href="/toLogin" style="width: 100%"><el-button style="width: 100%" type="primary"> 登 录 </el-button></a>
                    </div>
                </el-form-item>
            </el-form>
        </div>
    </div>


<script>

    var register = new Vue({
        el:"#register",
        data:{
            form: {role:0},
            rules: {
                username: [
                    {required: true, message: '请输入用户名', trigger: 'blur'},
                ],
                password: [
                    {required: true, message: '请输入密码', trigger: 'blur'},
                ],
                confirm: [
                    {required: true, message: '请确认密码', trigger: 'hover'},
                ],
            },
            reqUrl:"user/register"
        },
        methods: {
            register() {
                if(this.form.password == this.form.confirm){
                    if (this.form.role===0){
                        this.reqUrl = "user/register"
                    }else{
                        this.reqUrl = "admin/register"
                    }
                    $("#registerForm").prop("action",this.reqUrl)
                    $("#registerForm").submit();
                }else{
                    alert("两次密码输入不匹配!")
                }

            }
        }
    })
</script>
</body>
</html>