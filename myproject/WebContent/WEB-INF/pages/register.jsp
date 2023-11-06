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

<title>注册</title>
<script>
			/*密码验证*/
			function checkPwd(){
				var Val=document.getElementById("pwd").value;
				var TextId=document.getElementById("pwd_prompt");
				TextId.innerHTML="";
				var reg=/^[a-zA-Z0-9]{4,10}$/;
				if(reg.test(Val)==false){
					TextId.innerHTML="密码长度4-10不能含有非法字符";
					return false;
				}
				return true;
			}
			function checkRepwd(){
				var Val=document.getElementById("repwd").value;
				var Val2=document.getElementById("pwd").value;
				var TextId=document.getElementById("repwd_prompt");
				TextId.innerHTML="";
				if(Val!=Val2){
					TextId.innerHTML="两次输入密码不一致";
					return false;
				}
				return true;
			}
			function Check(){
				if(checkPwd()&&checkRepwd()){
// 					alert("正确");
					return true;
				}
				return false;
// 				alert("存在错误格式，请仔细核查");
			}
</script>
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
	<div class="w" id="regist">
		<section>
			<!-- <h1 hidden>主体区</h1> -->
			<div id="reg_top">
				<ul>
					<li class="curr"><a>个人用户</a></li>
				</ul>
				<p>
					我已经注册，现在就<a href="/myproject/login.jsp">登录</a>
				</p>
			</div>
			<div id="reg_main">
				<form action="/myproject/admin/adminregister" method="post" onsubmit="return Check()">
					<div id="reg_form">
						<div class="item">
							<span><b>*</b>用户id：</span>
							<div>
								<input type="text" name="adid" /> <i class="i-id"></i>
							</div>
						</div>
						<div class="item">
							<span><b>*</b>用户名：</span>
							<div>
								<input type="text" name="adname" /> <i class="i-name"></i>
							</div>
						</div>
						<div class="item">
							<span><b>*</b>请设置密码：</span>
							<div>
								<input id="pwd" type="password" name="adpassword" onblur="checkPwd()"/> <i class="i-pwd"></i>
								<label id="pwd_prompt"></label>
							</div>
						</div>
						<div class="item">
							<span><b>*</b>请确认密码：</span>
							<div>
								<input id="repwd" type="password" /> <i class="i-pwd" onblur="checkRepwd()"></i>
								<label id="repwd_prompt"></label>
							</div>
						</div>
						<div class="item">
							<span><b>*</b>年龄：</span>
							<div>
								<input type="number" min="1" max="120" />
							</div>
						</div>
						<div class="item">
							<span>&nbsp;</span>
							<div>
								<input type="checkbox" checked /> <b>我已阅读并同意</b>
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
				<a href="admin/register">关于我们</a>| <a href="admin/register">联系我们</a>
			</div>
		</nav>
		<div class="w" id="footer">
			<!-- <h1 hidden>版权信息</h1> -->
			SDUST&#169版权所有
		</div>
	</footer>
</body>
</html>