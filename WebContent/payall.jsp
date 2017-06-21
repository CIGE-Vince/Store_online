<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eshore.pojo.Goods"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>无人问津、Vince科技</title>
		<jsp:include page="common/common.jsp"/>
		<script type="text/javascript" src="js/shopcart/pay.js"></script>
	</head>

	<body style="text-align:center">
		<div id="top">
			<jsp:include page="head.jsp"/> 
		</div>
		<p>
		<div align="center">
			<jsp:include page="logo_select.jsp"/> 
		</div>
		<br>
		<div align="center">
			<div style="width: 80%; height: 100%;">
				<table width="100%" align="center" border="0">
					<tr>
						<td width="100%">
							<form action="shoppingcart" method="post" id="pay" name="pay">
								<input type="hidden" name="shopcartId" value="${shopcartId}">
								<input type="hidden" name="flag" value="payall">
								<input type="hidden" name="action" value="pay">
								<div style="padding-left: 3%; padding-top: 3px; ">
									<div>
										<div id="title">
											确认收货地址
										</div>
										<br>
										<table style="padding-left: 10%">
											<tr>
												<th align="right">
													地区：
												</th>
												<br>
												<td>
													<select id="province" name="province">
														<option value="0" selected="selected">选择省</option>
														<option value="1" >广东</option>
													</select>
													<select id="city" name="city">
														<option value="0" selected="selected">选择市</option>
														<option value="1" >惠州</option>
													</select>
													<select id="town" name="town">
														<option value="0" selected="selected">选择城区</option>
														<option value="1" >惠城区</option>
													</select>
												</td>
											</tr>
											<br>
											<tr>
												<th align="right">
													邮政编码：
												</th>
												<td>
													<input type="text" name="postcode" class="digits"
														maxlength="6" minlength="6">
												</td>
											</tr>
											<br>
											<tr>
												<th align="right">
													街道地址：
												</th>
												<td>
													<input type="text" name="address" class="digits"
														maxlength="6" minlength="6">
												</td>
											</tr>
											<br>
											<tr>
												<th align="right">
													收货人姓名：
												</th>
												<td>
													<input type="text" name="name" class="required"
														maxlength="20" minlength="2">
												</td>
											</tr>
											<br>
											<tr>
												<th align="right">
													联系电话:
												</th>
												<td>
													<input type="text" name="phone" class="digits"
														maxlength="11" minlength="11">
												</td>
											</tr>
											<br>
										</table>
										<p>
										<div id="title">
											确认提交订单
										</div>
										<br>
										<p>
										<table style="padding-left: 10%">
											<tr>
												<th align="right">
													实付费用：
												</th>
												<br>
												<td>
													<div id="money" style="font-size: 25; font-family: Arial; color: red;">
				                                       ${countPrice}
				                                    </div>元(含运费)
												</td>
												<br>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<input type="submit" value="确认无误"
														style="background-image: url(image/button1.jpg); width: 150px; height: 35px; border-style: none; font-weight: bold;">
													
												</td>
											</tr>
										</table>
									</div>
								</div>
							</form>
						</td>
					</tr>
				</table>
			</div>
			<div id="foot">
				<jsp:include page="foot.jsp"/> 
			</div>

		</div>
	</body>
</html>
