<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../../app.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>placeList</title>
    <link href="${appPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="${appPath}/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="${appPath}/js/bootstrap.js" type="text/javascript"></script>
    <style>
        table th,table td{
            text-align: center;
            font-size: 21px;
        }
    </style>
</head>
<body>
<div class="container ">
    <div class="row" style="padding-top: 5%">
        <div class="col-sm-offset-2">
            <form class="form-inline">
                <div class="form-group">
                    <label for="mohu" style="font-size: large">场地搜索:</label>
                    <input type="text" name="mohu" class="form-control input-lg" id="mohu" value="${mohu==null?'':mohu}">
                </div>
                <a type="submit" class="btn btn-primary btn-lg" onclick="mohuPage()">搜索场地</a>
                    <a type="button" class="btn btn-info btn-lg col-sm-offset-2" data-toggle="modal" data-target="#addPlace">
                        添加场地
                    </a>
            </form>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover" style="text-align: center">
            <thead>
            <th class="active">id</th>
            <th>场地类型</th> <!--sportType.name -- placeType.name-->
            <th>场地名称</th> <!--placeType  name-->
            <th>校费标准</th> <!--placeType  charge_way-->
            <th>场地状态</th> <!--placeInfo.status-->
            <th>备注</th>     <!--placeInfo.note-->
            <th>操作</th>
            </thead>
            <tbody>
            <c:forEach var="place" items="${page.list}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${place.type.sportType.name}</td>
                    <td>${place.type.name}</td>
                    <td>${place.type.chargeWay.note}</td>
                    <td>
                        <c:choose>
                            <c:when test="${place.status==0}">
                                可用
                            </c:when>
                            <c:when test="${place.status==1}">
                                正在使用
                            </c:when>
                            <c:when test="${place.status==2}">
                                被预定
                            </c:when>
                            <c:when test="${place.status==3}">
                                被禁用
                            </c:when>
                        </c:choose>
                    </td>
                    <td>${place.note}</td>
                    <td>
                        <a href="javascript:;" onclick="showPlaceInfo(${place.id})" class="btn btn-info"
                            <%--data-toggle="modal" data-target="#showInfo"--%>>查看</a>
                        <a href="javascript:;" onclick="editPlaceInfo(${place.id})" class="btn btn-success"
                           <%--data-toggle="modal" data-target="#editInfo"--%>>编辑</a>
                        <!-- 删除确认 -->
                        <div class="btn-group">
                            <a href="javascript:;"  class="btn btn-danger dropdown-toggle"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                删除</a>
                            <ul class="dropdown-menu">
                                <li style="display: inline">
                                    <div style="display: inline-flex; width: 20px">
                                        &nbsp;&nbsp;
                                        <a style="display: inline-flex; flex: 1"  href="/place/deletePlace?id=${place.id}" class="btn btn-danger">
                                            删除</a>
                                        &nbsp;&nbsp;&nbsp;
                                        <a href="javascript:;" class="btn btn-primary">
                                            取消</a>
                                    </div>

                                </li>
                            </ul>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <%--分页--%>
    <nav class="row">
        <div class="col-sm-4">
            <ul class="pagination">
                <!-- 上一页  -->
                <!-- 当当前页码为1时，隐藏上一页按钮  -->
                <li <c:if test="${page.pageNum==1}">class="disabled"</c:if>>
                    <!-- 当当前页码不等于1时，跳转到上一页  -->
                    <a
                            <c:if test="${page.pageNum==1}">href="javaScript:void(0)"</c:if>
                            <c:if test="${page.pageNum!=1}">href="javaScript:pageTo('${page.pageNum-1}')"</c:if>
                    >上一页</a>
                </li>

                <!-- 页码  -->
                <!-- 当总页数小于等于7时，显示页码1...7页 -->
                <c:if test="${page.pages<=7}">
                    <c:forEach begin="1" end="${page.pages}" var="i">
                        <li <c:if test="${page.pageNum==i}">class="active"</c:if>>
                            <a
                                    href="javaScript:pageTo('${i}')">${i}</a>
                        </li>
                    </c:forEach>
                </c:if>
                <!-- 当总页数大于7时 -->
                <c:if test="${page.pages>7}">
                    <!-- 当前页数小于等于4时，显示1到5...最后一页 -->
                    <c:if test="${page.pageNum<=4}">
                        <c:forEach begin="1" end="5" var="i">
                            <li <c:if test="${page.pageNum==i}">class="active"</c:if>>
                                <a
                                        href="javaScript:pageTo('${i}')">${i}</a>
                            </li>
                        </c:forEach>
                        <li><a href="#">...</a></li>
                        <li
                                <c:if test="${page.pageNum==page.pages}">class="active"</c:if>>
                            <a
                                    href="javaScript:pageTo('${page.pages}')">${page.pages}</a>
                        </li>
                    </c:if>
                    <!-- 当前页数大于4时，如果当前页小于总页码书-3，则显示1...n-1,n,n+1...最后一页 -->
                    <c:if test="${page.pageNum>4}">
                        <c:if test="${page.pageNum<page.pages-3}">
                            <li><a
                                    href="javaScript:pageTo('${1}')">${1}</a>
                            </li>
                            <li><a href="#">...</a></li>
                            <c:forEach begin="${page.pageNum-1}" end="${page.pageNum+1}"
                                       var="i">
                                <li <c:if test="${page.pageNum==i}">class="active"</c:if>>
                                    <a
                                            href="javaScript:pageTo('${i}')">${i}</a>
                                </li>
                            </c:forEach>
                            <li><a href="#">...</a></li>
                            <li
                                    <c:if test="${page.pageNum==page.pages}">class="active"</c:if>>
                                <a
                                        href="javaScript:pageTo('${page.pages}')">${page.pages}</a>
                            </li>
                        </c:if>
                    </c:if>
                    <!-- 当前页数大于4时，如果当前页大于总页码书-4，则显示1...最后一页-3，最后一页-2，最后一页-1，最后一页 -->
                    <c:if test="${page.pageNum>page.pages-4}">
                        <li><a
                                href="javaScript:pageTo('${1}')">${1}</a>
                        </li>

                        <li><a href="#">...</a></li>
                        <c:forEach begin="${page.pages-3}"
                                   end="${page.pages}" var="i">
                            <li <c:if test="${page.pageNum==i}">class="active"</c:if>>
                                <a
                                        href="javaScript:pageTo('${i}')">${i}</a>
                            </li>
                        </c:forEach>
                    </c:if>
                </c:if>
                <!-- 下一页  -->
                <!-- 当当前页码为最后一页或者最后一页为0时，隐藏下一页按钮
                                   当当前页码不等于总页码时，跳转下一页  -->
                <li <c:if test="${page.pageNum==page.pages || page.pages==0}">class="disabled"</c:if>>
                    <a <c:if test="${page.pageNum==page.pages || page.pages==0}">href="javaScript:void(0)"</c:if>
                       <c:if test="${page.pageNum!=page.pages}">href="javaScript:pageTo('${page.pageNum+1}')"</c:if>>下一页</a>
                </li>
            </ul>
        </div>

        <!-- 跳转页 -->
        <div class="jump col-sm-8">
            <div class="col-sm-3"3.>
                共${page.pages}页,${page.total}条记录
            </div>
            <div class="col-sm-2">
                <select name="pageSize" onchange="mohuPage()" class="form-control">
                    <c:if test="${page.pageSize==5}">
                        <option value="5" selected>5/页</option>
                        <option value="10">10/页</option>
                        <option value="15">15/页</option>
                        <option value="20">20/页</option>
                    </c:if>
                    <c:if test="${page.pageSize==10}">
                        <option value="5">5/页</option>
                        <option value="10" selected>10/页</option>
                        <option value="15">15/页</option>
                        <option value="20">20/页</option>
                    </c:if>
                    <c:if test="${page.pageSize==15}">
                        <option value="5" >5/页</option>
                        <option value="10">10/页</option>
                        <option value="15" selected>15/页</option>
                        <option value="20">20/页</option>
                    </c:if>
                    <c:if test="${page.pageSize==20}">
                        <option value="5" >5/页</option>
                        <option value="10">10/页</option>
                        <option value="15">15/页</option>
                        <option value="20" selected>20/页</option>
                    </c:if>
                </select>
            </div>
            <div class="jump_text col-sm-7">
                <div class="el-col-sm-12">
                    <div class="col-sm-6">
                        <label for="jumpPage" class="col-sm-3 control-label">跳到</label>
                        <div class="col-sm-6">
                            <input type="text" name="jumpPage"
                                   id="jumpPage" class="form-control"
                                   onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <button type="button" class="btn btn-primary form-control"
                            onclick="goPage()">GO</button>
                </div>
            </div>
            <form id="myForm" action="/place/showPlace" enctype="multipart/form-data" method="post"></form>
        </div>
    </nav>
    <div style="clear: both;"></div>


    <!-- 查看 -->
    <div class="modal fade" id="showInfo" tabindex="1" role="dialog" aria-labelledby="showInfo" aria-hidden="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                        查看场地信息
                    </h4>
                </div>
                <div class="modal-body row col-sm-offset-1">
                    <form  class="form-horizontal" action="">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">场地id</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="id" readonly type="text" value="">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地类型</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="type" readonly type="text" value="">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">收费标准</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="chargeWay" readonly type="text" value="">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地状态</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="status" readonly type="text" value="">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地备注</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="note" readonly type="text" value="">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- modal -->
    <!-- 编辑 -->
    <div class="modal fade" id="editInfo" tabindex="1" role="dialog" aria-labelledby="editInfo" aria-hidden="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="">
                        编辑场地信息
                    </h4>
                </div>
                <div class="modal-body row col-sm-offset-1">
                    <form  class="form-horizontal" action="/place/updatePlace" enctype="multipart/form-data" method="post">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">场地id</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="id" readonly type="text" value="">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地类型</label>
                            <div class="col-sm-6">
                                <select id="typeSelect" name="typeId" class="form-control">
                                    <option value="1">羽毛球标准场</option>
                                    <option value="2">羽毛球普通场</option>
                                    <option value="3">乒乓球场</option>
                                    <option value="4">篮球室内场</option>
                                    <option value="5">足球室内场</option>
                                    <option value="6">游泳馆</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">收费标准</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="chargeWay" readonly  type="text" value="">
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地状态</label>
                            <div class="col-sm-7 radio">
                                <label class="radio-inline">
                                    <input type="radio" name="status"  value="0"> 可用
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status"  value="1"> 正在使用
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status"  value="2"> 被预定
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status"  value="3"> 禁用
                                </label>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地备注</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="note"  type="text" value="">
                            </div>
                        </div>
                        <div class="modal-footer col-sm-offset-2">
                            <input type="submit" class="btn btn-success" value="保存修改"/>
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- modal -->
    <!-- 添加 -->
    <div class="modal fade" id="addPlace" tabindex="1" role="dialog" aria-labelledby="addPlace" aria-hidden="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                        添加场地
                    </h4>
                </div>
                <div class="modal-body row col-sm-offset-1">
                    <form  class="form-horizontal" action="/place/addPlace" enctype="multipart/form-data" method="post">
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地类型</label>
                            <div class="col-sm-6">
                                <select  name="typeId" class="form-control">
                                    <option value="1" selected>羽毛球标准场</option>
                                    <option value="2">羽毛球普通场</option>
                                    <option value="3">乒乓球场</option>
                                    <option value="4">篮球室内场</option>
                                    <option value="5">足球室内场</option>
                                    <option value="6">游泳馆</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地状态</label>
                            <div class="col-sm-7 radio">
                                <label class="radio-inline">
                                    <input type="radio" name="status"  value="0" checked> 可用
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status"  value="1"> 正在使用
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status"  value="2"> 被预定
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status"  value="3"> 禁用
                                </label>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-sm-3 control-label">场地备注</label>
                            <div class="col-sm-6">
                                <input class="form-control" name="note"  type="text" value="">
                            </div>
                        </div>
                        <div class="modal-footer col-sm-offset-2">
                            <input type="submit" class="btn btn-primary" value="添加场地"/>
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">关闭
                            </button>
                        </div>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- modal -->

</div>

<%--按钮操作--%>
<script type="text/javascript" charset="utf-8">
    var data ;
    function showPlaceInfo(id){
        $.ajax({
            url:"/place/getPlaceInfo",
            type:"POST",
            data:{id:id},
            async:false,
            success:(res)=>{
                $("#showInfo input[name='id']").val(res.id);
                $("#showInfo input[name='type']").val(res.type.name);
                $("#showInfo input[name='chargeWay']").val(res.type.chargeWay.note)
                switch (res.status){
                    case 0:  $("#showInfo input[name='status']").val("可用"); break;
                    case 1:  $("#showInfo input[name='status']").val("正在使用"); break;
                    case 2:  $("#showInfo input[name='status']").val("被预定"); break;
                    case 3:  $("#showInfo input[name='status']").val("禁用"); break;
                }
                $("#showInfo input[name='note']").val(res.note)
                $('#showInfo').modal('show');
            }
        })
    }

    function editPlaceInfo(id){
        $.ajax({
            url:"/place/getPlaceInfo",
            type:"POST",
            data:{id:id},
            async:false,
            success:(res)=>{
                $("#editInfo input[name='id']").val(res.id);
                $("select[name='typeId']").val(res.type.id);
                $("#editInfo input[name='chargeWay']").val(res.type.chargeWay.note)
                switch (res.status){
                    case 0: $("#editInfo input[name='status'][value = '0']").prop("checked",true); break;
                    case 1: $("#editInfo input[name='status'][value = '1']").prop("checked",true); break;
                    case 2: $("#editInfo input[name='status'][value = '2']").prop("checked",true); break;
                    case 3: $("#editInfo input[name='status'][value = '3']").prop("checked",true); break;
                }
                $("#editInfo input[name='note']").val(res.note)
                $('#editInfo').modal('show');
            }
        })
    }

</script>

<%--页面跳转--%>
<script>
    /*
      * 引用此页面，只需在外面
      */
    function goPage(){
        var jumpPage = document.getElementById("jumpPage").value;
        var totalPage = '${page.pages}';
        if(isNaN(jumpPage)){
            alert("请输入数字!");
            return;
        }else if(jumpPage.length==0){
            alert("请输入页码!");
        }else if(jumpPage<=0 || Number(jumpPage)>Number(totalPage)){
            alert("非法的页码【"+jumpPage+"】!");
            document.getElementById("jumpPage").value="";
            return;
        }else{
            var mohu = $("#mohu").val();
            var flag = $("input[name='pageNumber']");
            var pageSize = $("select[name='pageSize']").val()
            flag.remove();
            $("#myForm").append("<input type='hidden' name='pageNum' value='"+jumpPage+"' />");
            $("#myForm").append("<input type='hidden' name='mohu' value='"+mohu+"' />");
            $("#myForm").append("<input type='hidden' name='pageSize' value='"+pageSize+"' />");
            $("#myForm").submit();
        }
    }
    function pageTo(pageNumber){
        var jumpPage=1;
        if(pageNumber===-1){
            let curpage='${page.pageNum}';
            jumpPage=Number(curpage)-1;
        }else if(pageNumber===-2){
            let curpage='${pageNumber}';
            jumpPage=Number(curpage)+1;
        }else{
            jumpPage=Number(pageNumber);
        }
        var flag = $("input[name='pageNumber']");
        var mohu = $("#mohu").val();
        var pageSize = $("select[name='pageSize']").val()
        flag.remove();
        $("#myForm").append("<input type='hidden' name='pageNum' value='"+jumpPage+"' />");
        $("#myForm").append("<input type='hidden' name='mohu' value='"+mohu+"' />");
        $("#myForm").append("<input type='hidden' name='pageSize' value='"+pageSize+"' />");
        $("#myForm").submit();
    }
    function mohuPage(){
        var mohu = $("#mohu").val();
        var pageSize = $("select[name='pageSize']").val()
        $("#myForm").append("<input type='hidden' name='mohu' value='"+mohu+"' />");
        $("#myForm").append("<input type='hidden' name='pageSize' value='"+pageSize+"' />");
        $("#myForm").submit();
    }
</script>

</body>
</html>
