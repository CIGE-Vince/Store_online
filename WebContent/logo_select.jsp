<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Insert title here</title>
		<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
		<link href="css/search.css" type="text/css" rel="stylesheet" media="all">
	</head>

	<body style="text-align:center">
	<br>
			<div class="banner-text">
					<div class="agileits_search">
						<form action="goods" method="post" name="index-select">
							<input id="keyWord" type="text" name="keyWord"
					onblur="this.className='inputout';if(this.value==''){this.value='Enter your search ';}"
					onfocus="this.className='inputover';this.focus();if(this.value=='Enter your search '){this.value='';}"
					size="50" value="Enter your search " name="keyWord" required="">
							<select id="keyClass" name="keyClass" required="">
								<option value="0" selected="selected">categories</option>
								<option value="1">Name</option>
								<option value="2">Kinds</option>
							</select>
							<input type="hidden" name="action" value="index-select">
							<input class="submit" type="submit" value="Search">
						</form>
					</div> 
			</div>
		</div>
		
	</body>
</html>
