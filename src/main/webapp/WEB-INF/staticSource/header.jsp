<%@page import="ssm.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-headr">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">导航切换</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">COMMUNITY</a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <!-- 此处地址为/projectName/index，不能index原因是可能进入下一层url而出错 -->
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/topics">主题</a></li>
                <li><a href="${pageContext.request.contextPath}/makeQuestion">提问</a></li>
                <li><a href="${pageContext.request.contextPath}/makeEssay">写随笔</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">参与<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <!-- <li><a href="${pageContext.request.contextPath}/makeQuestion">提问</a></li>
                            <li class="divider"></li> -->
                        <li><a href="${pageContext.request.contextPath}/listQuestion">回答</a></li>
                        <!--     <li><a href="/WEB-INF/html/userManage.jsp" id="listQuestion">回答</a></li>  -->
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/listEssay">随笔</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">关于<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${pageContext.request.contextPath}/aboutUs">网站介绍</a></li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/connectUs">联系我们</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <c:if test="${currentUser == null}">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user">
                                    未登录
                                </span>
                            <span class="caret "></span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${pageContext.request.contextPath}/login"><span class="glyphicon glyphicon-log-in"></span> 登录/注册</a></li>
                        </ul>
                    </c:if>

                    <c:if test="${currentUser != null}">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span>
                                    <img src="/tomcat-userPho/${currentUser.smPho}"
                                         class="img-rounded" alt="头像" style="width: 25px ; height: 25px">
                                     ${currentUser.uName}
                                </span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${pageContext.request.contextPath}/user/${currentUser.uId}">
                                <span class="glyphicon glyphicon-stats"></span> 个人主页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/userSetting/${currentUser.uId}">
                                <span class="glyphicon glyphicon-repeat"></span> 修改资料</a>
                            </li>
                            <li><a href="javascript:void(0);" id="userLogout">
                                <span class="glyphicon glyphicon-off"></span> 退出登录</a>
                            </li>
                        </ul>
                    </c:if>

                </li>
            </ul>
            <form class="navbar-form navbar-right" name="loginform" id="loginform" method="post"
                  action="${pageContext.request.contextPath}/searchKeywords">
                <input type="text" class="form-control" id="keywords" name="keywords" value="" placeholder="搜索">
            </form>
        </div>
    </div>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/frontResource/JS/User/userAjax.js"></script>

</nav>