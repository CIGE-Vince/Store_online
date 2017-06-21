<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>注册用户</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/login-register.css" rel="stylesheet" type="text/css" media="all" />
	</head>

	<body>
		<div align="center">
			<div id="top">
				<jsp:include page="head.jsp"/>
			</div>
			<p>
			<div>
				<a id="img-link" href="index.jsp"> <img src="image/logo3.jpg" border="0"/> </a>
			</div>
			<br>
			<br>
			<div style="width: 100%; height: 100%" align="center">
				<div class="w3layouts-main2">
					<h3>Register Now</h3>
					<form action="register" method="post" id="register">
						<input placeholder="USER NAME" type="text" name="uname" value="${uname }"
									class="required" maxlength="50" minlength="3">
						<input placeholder="PASSWORD" id="passwd" type="password" name="passwd" 
									class="required" maxlength="50" minlength="3">
						<input placeholder="CONFIRM PASSWORD" id="passwd1" type="password" name="passwd1"
									class="required" maxlength="50" minlength="3">
						<input placeholder="E-MAIL" type="text" name="email" class="email" maxlength="50"
									minlength="7">
							<input type="submit" value="Register" name="submit" class="submit">
					</form>
				</div>
			</div>
			<div id="foot">
				<jsp:include page="foot.jsp"/> 
			</div>
		</div>
	</body>
</html>
