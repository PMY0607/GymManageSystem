<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../app.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${appPath}/layui/css/layui.css" media="all">
    <script src="${appPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
</head>
<body>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addUser">添加用户</button>
        <%--<button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<%--编辑弹出框--%>
<div class="layui-row" id="updateUser" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" id="userUpdate" action="/user/updateUser" lay-filter="userInfoUpdate" style="margin-top:20px">
            <div class="layui-form-item">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>个人信息</legend>
                </fieldset>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户id</label>
                <div class="layui-input-block">
                    <input type="text" name="id" required type="hidden" readonly lay-verify="required"
                           autocomplete="off" placeholder="id" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户账户</label>
                <div class="layui-input-block">
                    <input type="text" name="username" readonly value="test" required lay-verify="required"
                           autocomplete="off" placeholder="用户账户" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required"
                           autocomplete="off" placeholder="姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="gender" value="1" title="男">
                    <input type="radio" name="gender" value="0" title="女" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" required lay-verify="required"
                           autocomplete="off" placeholder="密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">会员等级</label>
                <div class="layui-input-block">
                    <input type="text" name="vip" required lay-verify="required"
                           autocomplete="off" placeholder="vip" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户余额</label>
                <div class="layui-input-block">
                    <input type="text" name="balance" required lay-verify="required"
                           autocomplete="off" placeholder="balance" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户积分</label>
                <div class="layui-input-block">
                    <input type="text" name="points" required lay-verify="required"
                           autocomplete="off" placeholder="points" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit "  type="submit" lay-filter="userInfoUpdate">确认修改</button>
                </div>
            </div>
        </form>
    </div>
    <script>
        layui.use(['form', 'layer'], function () {
            var form = layui.form,
                layer = layui.layer,
                $ = layui.$;

            //监听提交
            form.on('submit(userInfoUpdate)', function (arg) {
                console.info(arg.field);
                /*$.ajax({
                    url: 'updateUser',
                    data: {"user_id":arg.field.user_id,
                        "username":arg.field.username,
                        "password":arg.field.password,
                        "mail":arg.field.mail,
                        "manager":arg.field.manager},
                    dataType: 'json',
                    type: 'POST',
                    success:function(result){
                        if(result == null){
                            layer.msg("更新失败！");
                        }else{
                            //当你在iframe页面关闭自身时
                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            //layer信息提示
                            layer.msg('更新成功');
                            parent.location.reload(); //刷新父页面
                            setTimeout(function () { parent.layer.close(index) }, 330);//延迟
                        }
                    }
                });*/
                return false;//组织表单默认提交并跳转
            });
        });
    </script>

</div>

<%--添加弹出框--%>
<div class="layui-row" id="addUser" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" id="addUserForm" action="/user/addUser"
              lay-filter="addUserForm" style="margin-top:20px">
            <div class="layui-form-item">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                    <legend>添加用户</legend>
                </fieldset>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text" name="username" required lay-verify="required"
                           autocomplete="off" placeholder="用户账户" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required"
                           autocomplete="off" placeholder="姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="gender" value="1" title="男">
                    <input type="radio" name="gender" value="0" title="女" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="text" name="password" required lay-verify="required"
                           autocomplete="off" placeholder="密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">会员等级</label>
                <div class="layui-input-block">
                    <select name="vip" lay-verify="">
                        <option value="0">普通用户</option>
                        <option value="1">会员</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit "  type="submit" lay-filter="addUserForm">添加</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="${appPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->

<script type="text/html" id="headPic">
    <img src="/file/showPic?path=" style="border-radius: 50%"  width="135px" height="135px">
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#test'
            , url: '/user/userList'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', hide: true}    //用户真实id
                , {
                    field: 'listId', title: '序号', templet: function (d) {
                        return d.LAY_TABLE_INDEX + 1
                    }, width: 80, fixed: 'left', unresize: true, sort: true
                }         //表格序号
                , {field: 'headPic', title: '头像', width: 160,
                templet :(d)=>{
                    return '<img src="/file/showPic?path='+d.headPic+'" ' + 'width="50px" height="50px"/>';
                }
                }
                , {field: 'username', title: '用户名', width: 160}
                , {field: 'name', title: '姓名', width: 150}
                , {
                    field: 'gender', title: '性别', width: 80, sort: true,
                    templet: function (d) {
                        if (d.gender == 1) {
                            return '男'
                        } else {
                            return '女'
                        }
                    }
                }
                , {field: 'tel', title: '电话', width: 180}
                , {
                    field: 'registerTime', title: '注册时间', width: 150,
                    align: "center",
                    templet: "<div>{{layui.util.toDateString(d.registerTime, 'yyyy年-MM月-dd日')}}</div>"
                }
                , {field: 'vip', title: '会员等级', width: 120, sort: true}
                , {field: 'balance', title: '余额', width: 120}
                , {field: 'points', title: '积分', width: 100, sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo'}
            ]]
            , page: true
            , request: {
                pageName: 'pageNum'
                , limitName: 'pageSize'
            }
            , parseData: (res) => {
                return {
                    "code": res.code,
                    "msg": res.msg,
                    "count": res.data.size,
                    "data": res.data.list
                }
            }
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                /*case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;*/
                case 'addUser':{
                    layer.open({
                        type: 1,
                        title: "添加用户",
                        area: ['420px', '630px'],
                        shade: 0.3,
                        content: $("#addUser"),
                        success: (layero, index) => {
                            //找到它的子窗口的body
                            layui.form.render()
                            var flag = false;
                            $("#addUserForm").submit(()=>{
                                let username = $("#addUserForm input[name='username']").val()
                                $.ajax({
                                    type:"POST",
                                    async:false,
                                    url: "/user/userIsExist",
                                    data: {username:username},
                                    success:(res)=>{
                                        if(res.code =="0"){
                                            flag = true
                                            layer.msg("添加成功!")
                                        }else{
                                            layer.msg("用户名已存在!")
                                        }
                                    }
                                })
                                return flag
                            })
                        }
                    })
                }
            }

        });

        var open ;
        //监听行工具事件
        table.on('tool(test)', function (obj)
        {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    $.post("/user/delUserById",{id:data.id},()=>{
                        layer.msg("删除成功!")
                    })
                    console.log(obj)
                     layer.close(index);
                });
            } else if (obj.event === 'edit') {
               open = layer.open({
                    type: 1,
                    title: "个人信息",
                    area: ['420px', '630px'],
                    shade: 0.3,
                    content: $("#updateUser"),
                    success: (layero, index) => {
                        //找到它的子窗口的body
                        $("#updateUser input[name=username]").val(data.username)
                        $("#updateUser input[name=id]").val(data.id)
                        $("#updateUser input[name=name]").val(data.name)
                        $("#updateUser input[name=gender][value='1']").prop("checked", data.gender == 1 ? true : false)
                        $("#updateUser input[name=gender][value='0']").prop("checked", data.gender == 0 ? true : false)
                        layui.form.render()
                        $("#updateUser input[name=password]").val(data.password)
                        $("#updateUser input[name=vip]").val(data.vip)
                        $("#updateUser input[name=balance]").val(data.balance)
                        $("#updateUser input[name=points]").val(data.points)
                    }
                })
            }
        });

        $("#userUpdate").submit(function (res) {
            layer.close(open)
            return true;
        })
    });
</script>

<%--自定--%>
<script>

</script>

</body>
</html>