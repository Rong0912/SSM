<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontResource/css/list.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/frontResource/css/home.css">
<link href="${pageContext.request.contextPath}/frontResource/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/frontResource/JS/other/jquery-3.2.1.min.js" charset="utf-8"
			type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/frontResource/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/frontResource/JS/other/vue.min.js"></script>

<title>${pointUser.uName} -- Answer</title>
	<%--强制界面刷新--%>
	<%--<script type="text/javascript">
		$(document).ready(function () {

			if(location.href.indexOf("#")==-1){
				location.href=location.href+"#";
				location.reload();
			}
		});
	</script>--%>
	<script type="text/javascript">
		function relationAndNoRelation() {
			var followId=$('#followId').val();
			alert(followId)
			$.ajax({
				type:'POST',
				url:'/YourAnswer/UserRelation/'+followId,
				data:{
					"pointUserId": followId,
				},

            success:function (data,status) {
				var followedCount = $('#followed').text();
				if (status === "success" && data === 0) {
					$('#followingBtn2').text("关注");
					$("#followingBtn2").removeClass("active");
					if (followedCount === 0) {
						$('#followed').text(0);
					} else {
						--followedCount;
						$('#followed').text(followedCount);
					}

				} else if (status === "success" && data === 10) {
					$('#followingBtn2').text("已关注");
					$("#followingBtn2").addClass("active");
					++followedCount;
					$('#followed').text(followedCount);
				}
			}
            })
		}
</script>
</head>
<body>

<%@ include file="/WEB-INF/staticSource/header.jsp"%>
	<div class="container">
		<br>
		<br>
		<br>
       	<div class="highlight">
       	 	<div class="col-lg-12">
				<div class="form-group">
					<h3>${pointUser.uName }</h3>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-2">
							<img style="width: 120px ;height: 120px;" src="/tomcat-userPho/${pointUser.smPho}"
								 class="img-rounded">
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<c:if test="${not empty pointUser.uWord }">
								<span class="glyphicon glyphicon-pencil"> ${pointUser.uWord }</span>
								</c:if>

							</div>
							<div class="form-group">
								<c:if test="${not empty pointUser.uResidence }">
								<span class="glyphicon glyphicon-home"> ${pointUser.uResidence }</span></c:if>
							</div>
							<div class="form-group">
								<c:if test="${not empty pointUser.uProfession }">
								<span class="glyphicon glyphicon-briefcase">  ${pointUser.uProfession }</span></c:if>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row" align="center">
								<div class="form-group col-md-2 ">
									<a id="followingBtn" class="btn" data-toggle="modal" data-target="#myModal1">
										<strong>关注</strong>
										<strong><h6 id="following">0</h6></strong>
									</a>
									<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
										 aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">关注</h4>
												</div>
												<div class="modal-body">
													<div id="app1">
														<template v-for="user in users">
															<div class="container">
																<div class="form-group row">
																	<div class="col-md-3" align="left" style="float: left">
																		<img :src=" '/tomcat-userPho/'+user.smPho"  class="img-rounded" alt="头像" style="width: 25px ; height: 25px">
																		<a :href="'${pageContext.request.contextPath}/user/' +
																					 user.uId " target="_blank">
																			{{user.uName}}</a> &nbsp;&nbsp;
																		<a style="color:#999999 ;margin-left: 20px;font-size: 11px" >{{user.uWord}} </a>


																	</div>
																	<c:if test="${pointUser.uId==currentUser.uId}"><%--是本人才可以取消关注或者进行关注--%>
																	<a onclick="relationAndNoRelation()" id="followingBtn2" class="btn btn-default active" <%--data-toggle="modal"--%> data-target="#myModal1" style="margin-left: 120px;float: left">
																		<input id="followId" type="hidden" name="followId" :value="+user.uId" />
																		<strong>已关注  </strong>

																</a>
																	</c:if>

																</div>
															</div>
														</template>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group col-md-2">
									<a id="followedBtn" class="btn" data-toggle="modal" data-target="#myModal2" >
										<strong>粉丝</strong>
										<strong><h6 id="followed">0</h6></strong>
									</a>
									<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
										 aria-labelledby="myModalLabel">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4 class="modal-title" id="myModalLabel">粉丝</h4>
												</div>
												<div class="modal-body">
													<div id="app2">
														<template v-for="user in users">
															<div class="container">
																<div class="form-group row">
																	<div class="col-md-3" align="left" style="float: left">
																		<img :src=" '/tomcat-userPho/'+user.smPho"  class="img-rounded" alt="头像" style="width: 25px ; height: 25px">
																		<a :href="'${pageContext.request.contextPath}/user/' +user.uId " target="_blank">
																			{{user.uName}}</a> &nbsp;&nbsp;
																		<a style="color:#999999 ;margin-left: 20px;font-size: 11px" >{{user.uWord}} </a>
																	</div>
																</div>
															</div>
														</template>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group col-lg-2">
									<input id="pointUserId" type="hidden" name="pointUserId" value="${pointUser.uId}"></input>
									<button id="followBtn" class="btn btn-default" type="button" style="margin-left: 20px">关注</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="row">
						<ul class="nav nav-tabs col-md-9">
							<li class="active"><a href="#Profile" rel="external nofollow" data-toggle="tab" >简介</a></li>
							<li><a href="#Answer" rel="external nofollow" data-toggle="tab">回答</a></li>
							<li><a href="#Question" rel="external nofollow" data-toggle="tab">提问</a></li>
							<li><a href="#Essay" rel="external nofollow" data-toggle="tab">随笔</a></li>
						</ul>
					</div>
					<div class="row">
			   			<div class="tab-content  col-md-9">
							<div id="Profile" class="active tab-pane">
								<div class="form-group">
								</div>


								<%--<input id="pointUserId" type="hidden" name="pointUserId" value="${pointUser.uId}">--%>
								<div class="form-group">
									<p>邮箱：	${pointUser.uEmail }</p>
								</div>
								<div class="form-group">
									<p>电话： 	${pointUser.uTel }</p>
								</div>
								<div class="form-group">
									<p>性别：	${pointUser.uGender }</p>
								</div>
								<div class="form-group">
									注册日期：<fmt:formatDate value="${pointUser.uRegistDate}"  pattern="yyyy-MM-dd"/>
									<%--<p>注册日期：${pointUser.uRegistDate.split(" ")[0]} </p>--%>

								</div>
							</div>

							<div id="Answer" class="tab-pane">
								<div class="highlight">
									<c:forEach items="${pointUsersAnswer}" var="answer" varStatus="st">
										<h4><a href="${pageContext.request.contextPath}/Question/${answer.aBelongToQuestionId}/showAnswer/${answer.aId}" target="_blank">${answer.aBelongToQuestion.qTitle }</a></h4>
										<p>	${answer.aContent }</p>
										<!-- 格式化从数据库读取的时间 -->
										<p><fmt:formatDate value="${answer.aMadeDate }" pattern="yyyy-MM-dd "/></p>
										<c:if test="${answer.aMadeByUserId == currentUser.uId}">
											<a href="${pageContext.request.contextPath}/Answer/${answer.aId}/update"><span
													class="glyphicon glyphicon-pencil"></span> 修改</a>
										</c:if>
										<hr>
									</c:forEach>
								</div>
							</div>

							<div id="Question" class="tab-pane">
								<div class="highlight">
									<c:forEach items="${pointUsersQuestion}" var="question" varStatus="st">
										<h4><a href="${pageContext.request.contextPath}/Question/${question.qId}" target="_blank">${question.qTitle }</a></h4>
										<p>	${question.qDetail }</p>
										<!-- 格式化从数据库读取的时间 -->
										<p><fmt:formatDate value="${question.qMadeDate }" pattern="yyyy-MM-dd HH:mm"/></p>
										<hr>
									</c:forEach>
								</div>
							</div>

							<div id="Essay" class="tab-pane">
								<div class="highlight">
									<c:forEach items="${pointUserEssay}" var="essay" varStatus="st">
										<h4><a href="${pageContext.request.contextPath}/Essay/${essay.essayId}"
											   target="_blank">${essay.essayTitle }</a></h4>
										<p>	点击标题查看随笔全部内容</p>
										<!-- 格式化从数据库读取的时间 -->
										<p><fmt:formatDate value="${essay.essayMadeDate }" pattern="yyyy-MM-dd HH:mm"/></p>
										<c:if test="${essay.essayMadeByUserId == currentUser.uId}">
											<a href="${pageContext.request.contextPath}/Essay/${essay.essayId}/update"><span
													class="glyphicon glyphicon-pencil"></span> 修改</a>
										</c:if>
										<hr>
									</c:forEach>
								</div>
							</div>

			   			</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<%@ include file="/WEB-INF/staticSource/footer.jsp"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/frontResource/JS/User/follow.js">
</script>
</body>
</html>