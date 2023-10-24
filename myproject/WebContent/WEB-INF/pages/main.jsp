<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>主界面</title>
<script
	src="https://cdn.jsdelivr.net/npm/live2d-widget@3.0.4/lib/L2Dwidget.min.js">
		</script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js">
		</script>
<script type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2"
	count="200"
	src="//cdn.bootcss.com/canvas-nest.js/1.0.0/canvas-nest.min.js">
		</script>
<base href="<%=basePath%>">
<meta charset="utf-8">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>/css/reglog.css">
<title>Insert title here</title>
<nav id="top">
	<!-- <h1 hidden>欢迎注册LTT管理用户</h1> -->
	<div class="w">
		<div id="top_left">
			<b></b> <a href="/myproject/admin/main">首页</a>
		</div>
		<ul id="top_right">
			<li><a href="/myproject/admin/login">立即登录</a> <s></s> <a
				href="/myproject/admin/register">免费注册</a></li>
		</ul>
	</div>
</nav>
</head>
<body>
<embed  src="music/backmusic.mp3" loop="1000" autostar="true" hidden="true"/>
	<div id="page_end_html" align="center">
		<p>这就是一个主界面^_^</p>
		<p>累了，就在这里休息一下吧。</p>
	</div>
</body>
<script type="text/javascript">
		L2Dwidget.init();
		! function() {
			function n(n, e, t) {
				return n.getAttribute(e) || t
			}

			function e(n) {
				return document.getElementsByTagName(n)
			}

			function t() {
				var t = e("script"),
					o = t.length,
					i = t[o - 1];
				return {
					l: o,
					z: n(i, "zIndex", -1),
					o: n(i, "opacity", .5),
					c: n(i, "color", "0,0,0"),
					n: n(i, "count", 99)
				}
			}
			function o() {
				a = m.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth, c = m.height =
					window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight
			}
			function i() {
				r.clearRect(0, 0, a, c);
				var n, e, t, o, m, l;
				s.forEach(function(i, x) {
					for (i.x += i.xa, i.y += i.ya, i.xa *= i.x > a || i.x < 0 ? -1 : 1, i.ya *= i.y > c || i.y < 0 ? -1 : 1, r.fillRect(
							i.x - .5, i.y - .5, 1, 1), e = x + 1; e < u.length; e++) n = u[e], null !== n.x && null !== n.y && (o = i.x -
						n.x, m = i.y - n.y, l = o * o + m * m, l < n.max && (n === y && l >= n.max / 2 && (i.x -= .03 * o, i.y -= .03 *
							m), t = (n.max - l) / n.max, r.beginPath(), r.lineWidth = t / 2, r.strokeStyle = "rgba(" + d.c + "," + (t +
							.2) + ")", r.moveTo(i.x, i.y), r.lineTo(n.x, n.y), r.stroke()))
				}), x(i)
			}
			var a, c, u, m = document.createElement("canvas"),
				d = t(),
				l = "c_n" + d.l,
				r = m.getContext("2d"),
				x = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window
				.oRequestAnimationFrame || window.msRequestAnimationFrame || function(n) {
					window.setTimeout(n, 1e3 / 45)
				},
				w = Math.random,
				y = {
					x: null,
					y: null,
					max: 2e4
				};
			m.id = l, m.style.cssText = "position:fixed;top:0;left:0;z-index:" + d.z + ";opacity:" + d.o, e("body")[0].appendChild(
				m), o(), window.onresize = o, window.onmousemove = function(n) {
				n = n || window.event, y.x = n.clientX, y.y = n.clientY
			}, window.onmouseout = function() {
				y.x = null, y.y = null
			};
			for (var s = [], f = 0; d.n > f; f++) {
				var h = w() * a,
					g = w() * c,
					v = 2 * w() - 1,
					p = 2 * w() - 1;
				s.push({
					x: h,
					y: g,
					xa: v,
					ya: p,
					max: 6e3
				})
			}
			u = s.concat([y]), setTimeout(function() {
				i()
			}, 100)
		}();
	</script>
</html>
