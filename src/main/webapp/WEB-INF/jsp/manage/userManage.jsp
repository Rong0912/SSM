
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>社区后台管理系统</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/frontResource/static/js/jquery-3.2.1.min.js"></script>
    <link
            href="${pageContext.request.contextPath}/frontResource/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/frontResource/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<!-- 用户添加的模态框 -->
<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">username</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="username_add_input" placeholder="username">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">password</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="password_add_input" placeholder="****">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!--用户修改的模态框-->
<!-- 用户编辑的模态框 -->
<div class="modal fade" id="userModifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modifyModalLabel">用户修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">userID</label>
                        <div class="col-sm-10">
                            <input type="text" name="id" class="form-control" id="userId_modify_input" value="${user.id}" readonly placeholder="userid">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">username</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" id="username_modify_input" value="${user.username}" placeholder="username">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">password</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="password_modify_input" value="${user.password}" placeholder="password">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_modify_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 搭建显示页面 -->

    <!-- 标题 -->
   <%-- <div class="row">

    </div>--%>
    <div style="width: 100%;height: 65px;background-color: #3C94E7">
        <div class="col-md-12">
            <h1 style="font-size: 22px;color: white;margin-left: 40px">Community社区管理系统</h1>
        </div>
    </div>
    <br>

<div style="width: 180px;height: 800px ;float: left;padding-left: 10px" class="panel-collapse collapse in">
     <ul class="list-group">
         <li class="list-group-item" style="background-color: #F6F4F0">
             <a href="">
                <span class="glyphicon glyphicon-user"/> 用户管理
             </a>
         </li>


         <li class="list-group-item">
             <a href="">
                 <span class="glyphicon glyphicon-edit"/> 提问管理
             </a>
         </li>

         <li class="list-group-item">
             <a href="">
                 <span class="glyphicon glyphicon-check"/> 回答管理
             </a>
         </li>

         <li class="list-group-item">
             <a href="">
                 <span class="	glyphicon glyphicon-pencil"/> 随笔管理
             </a>
         </li>
     </ul>

</div>


<div class="container" style="float: left">

    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <%--<button class="btn btn-primary" id="user_add_modal_btn">新增</button>--%>
            <button class="btn btn-danger"  id="user_delete_all_btn">批量删除</button>
        </div>

        <form class="navbar-form navbar-right" name="loginform" id="loginform" method="post"
              action="${pageContext.request.contextPath}/searchUserMessage">
            <input type="text" class="form-control" id="keywords" name="keywords" value="" placeholder="搜索">
        </form>

    </div>
    <br>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="user_table" >
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>ID</th>
                    <th>头像</th>
                    <th>昵称</th>
                    <th>性别</th>
                    <th>地址</th>
                    <th>邮箱号</th>
                    <th>手机号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>
<script>
    var totalRecord,currentPage;
    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"/YourAnswer/userManage",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                console.log(result);
                //1、解析并显示员工数据
                build_users_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析显示分页条数据
                build_page_nav(result);

            }
        });
    }

    function build_users_table(result){
        //清空table表格
        $("#user_table tbody").empty();
        var users = result.extend.pageInfo.list;//list<User>users
        //index：下标 item：单个对象
        $.each(users,function(index,user){
            var checkBoxTd = $("<td><input type='checkbox' name='check-id' value="+user.uId+" class='check_item'/></td>");
            var uId = $("<td></td>").append(user.uId);
            var smPho=$("<td></td>").css({"background-image":" url(/tomcat-userPho/"+user.smPho+")","backgroundSize":"30px 30px","background-repeat":"no-repeat"});
            var uName = $("<td></td>").append(user.uName);
            var uGender = $("<td></td>").append(user.uGender);
            var uResidence = $("<td></td>").append(user.uResidence);
            var uEmail = $("<td></td>").append(user.uEmail);
            var uTel = $("<td></td>").append(user.uTel);
            var isLock=user.isLock;

            if(isLock===1){

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("封号");
                //为编辑按钮添加一个自定义的属性，来表示当前员工id
                editBtn.attr("edit-id",user.uId);}
            else{
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-ok")).append("解封");
                //为编辑按钮添加一个自定义的属性，来表示当前员工id
                editBtn.attr("edit-id",user.uId);
            }



            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",user.uId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(uId)
                .append(smPho)
                .append(uName)
                .append(uGender)
                .append(uResidence)
                .append(uEmail)
                .append(uTel)
                .append(btnTd)
                .appendTo("#user_table tbody");
        });
    }
    //解析分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页，共"+
            result.extend.pageInfo.pages+"页，共"+
            result.extend.pageInfo.total+"条记录");
        totalRecord=result.extend.pageInfo.total;//最后的数据
        currentPage=result.extend.pageInfo.pageNum;//当前页

    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框。
    $("#user_add_modal_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#userAddModal form");
        //弹出模态框
        $("#userAddModal").modal({
            backdrop:"static"
        });
    });
    //批量删除
    $("#user_delete_all_btn").click(function (){
        var ids="";
        var list=document.getElementsByName("check-id");
        for(var i=0;i<list.length;i++){
            if(list[i].checked){
                ids=ids+list[i].value+",";

            }
        }
        ids=ids.substring(0,ids.length-1);
        $.ajax({
            url:"/YourAnswer/batchDelete",
            type:"POST",
            data:{"ids":ids},
            success:function (result) {
                if(result.code==100){
                    //回到当前页面
                    to_page(currentPage);
                }else{
                    console.log(result);
                }
            }
        });


    });
    //点击保存，保存员工。
    $("#user_save_btn").click(function(){
        //2、发送ajax请求保存员工
        $.ajax({
            url:"${pageContext.request.contextPath}/add",
            type:"POST",
            data:$("#userAddModal form").serialize(),
            success:function(result){
                //alert(result.msg);
                if(result.code == 100){
                    //员工保存成功；
                    //1、关闭模态框
                    $("#userAddModal").modal('hide');
                    //2、显示刚才保存的数据
                    to_page(totalRecord);//保存到最后的那个页面
                }else{
                    //显示失败信息
                    console.log(result);
                }
            }
        });
    });

    //单个删除
    $(document).on("click",".delete_btn",function(){
        //1、弹出是否确认删除对话框
        var uName = $(this).parents("tr").find("td:eq(3)").text();
        var uId = $(this).attr("del-id");

        if(confirm("确认删除【"+uName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"/YourAnswer/delete",
                type:"POST",
                data:{"id":uId},
                success:function(result){
                    alert(result.msg);
                    if(result.code == 100){
                        to_page(currentPage);
                    }else{
                        //显示失败信息
                        console.log(result);
                    }
                }
            });
        }
    });
    //点击封号
    $(document).on("click",".edit_btn",function(){
        var uName = $(this).parents("tr").find("td:eq(3)").text();
        var Id = $(this).attr("edit-id");
        $.ajax({
            url:"/YourAnswer/edit",
            data:{"uId":Id},
            type:"POST",
            success:function(result){
              if(result==1){
                  alert(uName+"  解封成功")
                  to_page(currentPage)
              }
              else if(result==0){
                  alert("已对 "+uName+" 进行封号处理")
                  to_page(currentPage)
                }
              else {
                    alert("操作失败！")
                }

            }});


    });


    //点击编辑按钮弹出模态框。
    /*$(document).on("click",".edit_btn",function(){
        //1、发送ajax,根据id获取用户信息
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#userModifyModal form");
        var Id = $(this).attr("edit-id");
        $.ajax({
            url:"${APP_PATH}/edit?id="+Id,
            type:"GET",
            success:function(result){
                //填充用户信息
                console.log(result);

                $("#userId_modify_input").val(result.extend.user.id);
                $("#username_modify_input").val(result.extend.user.username);
                $("#password_modify_input").val(result.extend.user.password);
            }});
        //2、弹出模态框
        $("#userModifyModal").modal({
            backdrop:"static"
        });

    });*/

    //保存修改
    $("#user_modify_btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/update",
            type:"POST",
            data:$("#userModifyModal form").serialize(),
            success:function(result){
                //alert(result.msg);
                if(result.code == 100){
                    //员工保存成功；
                    //1、关闭模态框
                    $("#userModifyModal").modal('hide');
                    //2、显示刚才保存的数据
                    to_page(currentPage);
                }else{
                    //显示失败信息
                    console.log(result);
                }
            }
        });

    });
</script>
</body>
</html>