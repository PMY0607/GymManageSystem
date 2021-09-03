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
    <div class="col-sm-offset-1">
      <form class="form-inline">
        <div class="form-group">
          <label for="mohu" style="font-size: large">预约搜索:</label>
          <input type="text" name="mohu" class="form-control input-lg" id="mohu" value="${mohu==null?'':mohu}">
        </div>
        <a type="submit" class="btn btn-primary btn-lg" onclick="mohuPage()">搜索</a>
      </form>
    </div>
  </div>
  <div class="row">
    <table class="table table-hover" style="text-align: center">
      <thead>
      <th class="active">编号</th>
      <th>用户名</th>
      <th>场地类型</th>
      <th>场地名称</th>
      <th>校费标准</th>
      <th>预约状态</th>
      <th>场地预约时间</th>
      <th>预约时间</th>
      <th>操作</th>
      </thead>
      <tbody>
      <c:forEach var="info" items="${page.list}" varStatus="status">
        <tr>
          <td>${status.count}</td>
          <td>${info.user.username}</td>
          <td>${info.place.type.sportType.name}</td>
          <td>${info.place.type.name}</td>
          <td>${info.place.type.chargeWay.note}</td>
          <td>
            <c:choose>
              <c:when test="${info.status==0}">
                待审核
              </c:when>
              <c:when test="${info.status==1}">
                预约通过
              </c:when>
              <c:when test="${info.status==2}">
                拒绝预约
              </c:when>
            </c:choose>
          </td>
          <td><fmt:formatDate value="${info.startTime}" type="both" pattern="yyyy年MM月d日d HH:ss"/></td>
          <td><fmt:formatDate value="${info.bookTime}" type="both" pattern="yyyy年MM月d日d HH:ss"/></td>
          <td>
            <a href="javascript:;" onclick="showBookInfo(${info.id})" class="btn btn-info"
              <%--data-toggle="modal" data-target="#showInfo"--%>>查看</a>
            <!-- 拒绝确认 -->
            <div class="btn-group">
              <c:if test="${info.status==0}">
                <a href="/book/setBookStatus?bookId=${info.id}&status=1"  class="btn btn-success dropdown-toggle">通过预约</a>
                <a href="javascript:;"  class="btn btn-danger dropdown-toggle"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  拒绝预约</a>
                <ul class="dropdown-menu">
                  <li style="display: inline">
                    <div style="display: inline-flex; width: 20px">
                      &nbsp;&nbsp;
                      <a style="display: inline-flex; flex: 1"  href="/book/setBookStatus?bookId=${info.id}&status=2" class="btn btn-danger">
                        确定</a>
                      &nbsp;&nbsp;&nbsp;
                      <a href="javascript:;" class="btn btn-primary">
                        取消</a>
                    </div>

                  </li>
                </ul>
              </c:if>
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
      <form id="myForm" action="/book/bookInfoList" enctype="multipart/form-data" method="post"></form>
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
            查看预约信息
          </h4>
        </div>
        <div class="modal-body row col-sm-offset-1">
          <form  class="form-horizontal" action="">
            <div class="form-group">
              <label class="col-sm-3 control-label">预约id</label>
              <div class="col-sm-6">
                <input class="form-control" name="id" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">场地类型</label>
              <div class="col-sm-6">
                <input class="form-control" name="type" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">场地名称</label>
              <div class="col-sm-6">
                <input class="form-control" name="placeName" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">收费标准</label>
              <div class="col-sm-6">
                <input class="form-control" name="chargeWay" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">场地状态</label>
              <div class="col-sm-6">
                <input class="form-control" name="status" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">预约开始时间</label>
              <div class="col-sm-6">
                <input class="form-control" name="startTime" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">预约结束时间</label>
              <div class="col-sm-6">
                <input class="form-control" name="endTime" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">数量</label>
              <div class="col-sm-6">
                <input class="form-control" name="count" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">预约时间</label>
              <div class="col-sm-6">
                <input class="form-control" name="bookTime" disabled type="text" value="">
              </div>
            </div>
            <div class="form-group ">
              <label class="col-sm-3 control-label">预约备注</label>
              <div class="col-sm-6">
                <input class="form-control" name="note" disabled type="text" value="">
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
</div>

<%--按钮操作--%>
<script type="text/javascript" charset="utf-8">
  var data ;
  function showBookInfo(id){
    $.ajax({
      url:"/book/getBookInfo",
      type:"POST",
      data:{id:id},
      success:(res)=>{
        //时间格式化
        Date.prototype.Format = function (fmt) {
          var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "H+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
          };
          if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
          for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
          return fmt;
        }

        $("#showInfo input[name='id']").val(res.id);
        $("#showInfo input[name='type']").val(res.place.type.sportType.name);
        $("#showInfo input[name='placeName']").val(res.place.type.name)
        $("#showInfo input[name='chargeWay']").val(res.place.type.chargeWay.note)
        switch (res.status){
          case 0:  $("#showInfo input[name='status']").val("审核中"); break;
          case 1:  $("#showInfo input[name='status']").val("预约成功"); break;
          case 2:  $("#showInfo input[name='status']").val("预约失败"); break;
        }
        $("#showInfo input[name='startTime']").val(new Date(res.startTime).Format("yyyy年MM月dd日 HH:mm"))
        $("#showInfo input[name='endTime']").val(new Date(res.endTime).Format("yyyy年MM月dd日 HH:mm"))
        $("#showInfo input[name='count']").val(res.count)
        $("#showInfo input[name='bookTime']").val(new Date(res.bookTime).Format("yyyy年MM月dd日 HH:mm"))
        $("#showInfo input[name='note']").val(res.note)
        $('#showInfo').modal('show');
        console.log(res)
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
