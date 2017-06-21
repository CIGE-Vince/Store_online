<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>无人问津、Vince科技</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/login-register.css" rel="stylesheet" type="text/css" media="all" />
	</head>

	<body>
		<div align="center">
			<div id="top">
				<jsp:include page="head.jsp"></jsp:include>
			</div>
			<p>
			<div>
				<a id="img-link" href="index.jsp"> <img src="image/logo3.jpg" border="0"/> </a>
			</div>
			<br>
			<br>
			<div style="width: 100%; height: 100%" align="center">
				<div class="w3layouts-main" align="center">
					<h2>Login Now</h2>
						<form action="login" method="post" id="login">
							<input placeholder="NAME" name="uname" type="text" value="${uname}">
							<input placeholder="PASSWORD" name="passwd" type="password" required="">
							<input type="hidden" name="action" value="login">
							<input type="submit" value="Login" class="submit">
						</form>
						<h6><a href="register.jsp">Register</a></h6>
				</div>
			</div>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>
