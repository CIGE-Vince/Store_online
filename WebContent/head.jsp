<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Nobody Store</title>
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
		<script src="js/js/jquery.min.js"></script>
		<link href="http://cdn.bootcss.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
		<link href="css/animate.min.css" rel="stylesheet"> 
		<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
		<link href="css/search.css" type="text/css" rel="stylesheet" media="all">
	</head>

	<body>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="header-grid">
				<div class="header-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<%
						if (session.getAttribute("uname") == null
								|| session.getAttribute("uname").equals("")) {
					%>
					<ul>
						<li class="active"><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="login.jsp">Login</a></li>
						<li><i class="glyphicon glyphicon-book" aria-hidden="true"></i><a href="register.jsp">Register</a></li>
					</ul>
					<%
						} else {
					%>
						<a href="shoppingcart?action=lookbus" style="">welcome！&nbsp&nbsp<%=session.getAttribute("uname")%></a>
						<a href="login?action=logout" style="text-color:white">&nbsp&nbsp&nbsp&nbsp&nbsp[注销]</h></a>
					<%
						}
					%>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="logo-nav">
				<div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
					<h1><a href="index.jsp">Nobody<span>anywhere</span></a></h1>
				</div>
				<div class="logo-nav-left1">
					<nav class="navbar navbar-default">
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav">
							<li><a href="index.jsp">Home</a></li>	
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Products <b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="row">
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>phone</h6>
												<li><a href="goods?keyWord=nokia&keyClass=1&action=index-select">nokia</a></li>
												<li><a href="goods?keyWord=iphone&keyClass=1&action=index-select">iphone</a></li>
											</ul>
										</div>
										<div class="col-sm-4"> 	
											<ul class="multi-column-dropdown">
												<h6>camera</h6>
												<li><a href="goods?keyWord=fujinon&keyClass=1&action=index-select">fuji</a></li>
												<li><a href="goods?keyWord=nikon&keyClass=1&action=index-select">sony</a></li>
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>laptop</h6>
												<li><a href="goods?keyWord=lenovo&keyClass=1&action=index-select">lenovo</a></li>
												<li><a href="goods?keyWord=dell&keyClass=1&action=index-select">dell</a></li>
												<li><a href="goods?keyWord=acer&keyClass=1&action=index-select">acer</a></li>
												<li><a href="goods?keyWord=benq&keyClass=1&action=index-select">benq</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
						</ul>
					</div>
					</nav>
				</div>
				
				<div class="header-right">
					<div class="cart box_1">
						<a href="shoppingcart?action=lookbus">
							<h3> <div class="total">
								<span class="simpleCart_total"></div>
								<img src="images/bag.png" alt="" />
							</h3>
						</a>
					</div>	
				</div>
			</div>
		</div>
	</div>
<!-- //header -->
	</body>
</html>
