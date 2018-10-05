<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css"/> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="panel panel-primary">
	<!-- .panel-heading 面板头信息。 -->
	<div class="panel-heading">
		<!-- .panel-title 面板标题。 -->
		<h3 class="panel-title">登录</h3>
	</div>
</div>
<%
	String message = (String)request.getAttribute("message");
	if(message != null && !message.equals("")){
		%>
		<div class="col-md-8">
			<div class="alert alert-danger" role="alert">
			<%=message %>
			</div>
		</div>
		<%
	}
%>

<div class="container">
	<div class="row">
		<div class="col-md-8">
			<form class="form-horizontal" action="login"  method="post">
				<div class="form-group">
					<div class="input-group col-md-4">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input class="form-control" placeholder="登录名" type="text" name="loginname" />
					</div>
				</div>
				<div class="form-group">
					<div class="input-group col-md-4">
						<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
						<input class="form-control" placeholder="密码" type="text" name="password" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-4">
						<div class="btn-group btn-group-justified" >
							  <div class="btn-group" >
							    <button type="submit" class="btn btn-success" id="submitbtn">
							    	<span class="glyphicon glyphicon-share"></span>&nbsp;登录</button>
							  </div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>