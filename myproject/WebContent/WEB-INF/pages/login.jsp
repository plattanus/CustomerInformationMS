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

<title>登录</title>
<nav id="top">
	<!-- <h1 hidden>欢迎注册LTT管理用户</h1> -->
	<div class="w">
		<div id="top_left">
			<b></b> <a href="/myproject/admin/main">首页</a>
		</div>
		<ul id="top_right">
			<li><a href="/myproject/admin/login">立即登录</a> <s></s> <a href="/myproject/admin/register">免费注册</a></li>
		</ul>
	</div>
</nav>
</head>
<body>
<!-- 		<div id="reg_phone"> -->
<!-- 			<img src="img/phone-bg.jpg" /> -->
<!-- 		</div> -->
	<div class="w" id="regist">
		<section>
			<!-- <h1 hidden>主体区</h1> -->
			<div id="reg_top">
				<ul>
					<li class="curr"><a>个人用户</a></li>
				</ul>
				<p>
					我还没有账号，现在就<a href="/myproject/register.jsp">注册</a>
				</p>
			</div>
			<div id="reg_main">
				<form action="/myproject/admin/adminlogin" method="post">
					<div id="reg_form">
						<div class="item">
							<span><b>*</b>用户名：</span>
							<div>
								<input type="text" name="adname" /> <i class="i-name"></i>
							</div>
						</div>
						<div class="item">
							<span><b>*</b>密码：</span>
							<div>
								<input type="password" name="adpassword" /> <i class="i-pwd"></i>
							</div>
						</div>
						<div class="item">
							<span>&nbsp;</span>
							<div>
								<input type="checkbox" checked /> <b>记住密码</b>
							</div>
						</div>
						<div class="item">
							<span>&nbsp;</span>
							<div>
								<button onsubmit="Submit">提交</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>
	<footer>
		<nav class="w" id="foot_bar">
			<!-- <h1 hidden>底部链接</h1> -->
			<div>
				<a href="admin/login">关于我们</a>| <a href="admin/login">联系我们</a>
			</div>
		</nav>
		<div class="w" id="footer">
			<!-- <h1 hidden>版权信息</h1> -->
			SDUST&#169版权所有
		</div>
	</footer>
</body>
</html>