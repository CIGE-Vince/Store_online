<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>无人问津科技网—开心购！</title>
		<jsp:include page="common/common.jsp"/>
		<script type="text/javascript" src="js/common/index.js"></script>
	</head>

	<body>
		<div align="center">
			<div id="top">
				<jsp:include page="head.jsp"></jsp:include>
			</div>
			<p>
			<div id="logoselect">
				<jsp:include page="logo_select.jsp"></jsp:include>				
			</div>
			<input id="status" type="hidden" name="status" value="${status}">
			<br><br><br>
			<div>
			      <canvas id="c"></canvas>
			      <script src="js/flash.js"></script>
			</div>
			<br><br><br><br>
			<div id="foot">
				<jsp:include page="foot.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>
