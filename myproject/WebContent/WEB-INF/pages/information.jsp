<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>

<base href="<%=basePath%>">

<meta charset="utf-8">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>/css/reglog.css">

<title>管理员信息</title>
<nav id="top">
	<!-- <h1 hidden>欢迎注册LTT管理用户</h1> -->
	<div class="w">
		<div id="top_left">
			<b></b> <a href="/myproject/admin/main">首页</a>
		</div>
		<ul id="top_right">
			<li><a href="/myproject/customer/customerList">返回</a></li>
		</ul>
	</div>
</nav>
</head>
<body style="background:url(images/background.jpg)">
<embed  src="music/backmusic.mp3" loop="1000" autostar="true" hidden="true"/>
	<div class="w" id="regist">
		<section>
			<!-- <h1 hidden>主体区</h1> -->
<!-- 			<div id="reg_main"> -->
				<form>
					<div id="reg_form">
						<div class="item">
							<h1><span><b></b>当前正在使用的用户是：</span></h1>
							<div>
								<h1>${admin.adname}</h1>
							</div>
						</div>
						<div>
						<span><b></b></span><br>
							<img src="${pageContext.request.contextPath }/images/adminimg.jpg" width="114" height="104" />
						</div>
					</div>
				</form>
<!-- 			</div> -->
		</section>
	</div>
	<footer>
		<nav class="w" id="foot_bar">
			<!-- <h1 hidden>底部链接</h1> -->
			<div>
				<a href="admin/adinformation">关于我们</a>| <a href="admin/adinformation">联系我们</a>
			</div>
		</nav>
		<div class="w" id="footer">
			<!-- <h1 hidden>版权信息</h1> -->
			SDUST&#169版权所有
		</div>
	</footer>
</body>
</html>