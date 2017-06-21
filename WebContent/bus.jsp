<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.eshore.pojo.Goods"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>无人问津、Vince科技</title>
		<jsp:include page="common/common.jsp"/>
		<script type="text/javascript" src="js/shopcart/bus.js"></script>
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
		<input id="status" type="hidden" name="status" value="${status }">
		<div align="center">
			<div style="width: 80%; height: 78%;">
				<div id="left" align="left">
					<div style="padding-top: 2px;">
						<div id="title">
							个人信息
						</div>
						<br>
						<ul id="myinf">
							<li>
								<a href="user?action=show">我的信息</a>
							</li><br>
							<li>
								<a href="user?action=edit">修改基本信息</a>
							</li><br>
							<li>
								<a href="user/editpasswd.jsp">修改密码</a>
							</li><br>
						</ul>
						<p>
						<div id="title">
							我的购物车
						</div>
						<br>
						<ul>
							<li>
								<a href="shoppingcart?action=lookbus">购物车</a>
							</li><br>
							<li>
								<a href="shoppingcart?action=paid">已购买的宝贝</a>
							</li><br>
						</ul>
					</div>
				</div>
				<div id="right" align="left" >
					<div
						style="padding-right: 3%; padding-left: 5%; width: 92%; height: 100%;">
						<div align="center">
							<div id="title" align="left">
								<table width="90%">
									<tr style="text-align: center">
										<td width="100px" >图片</td>
										<td width="180px">宝贝详细</td>
										<td width="90px">单价（元）</td>
										<td width="150px">数量</td>
										<td width="100px">总计（元）</td>
										<td colspan="2" width="150px">操作</td>
									</tr>
								</table>
								<br>
							</div>
							<form action="shoppingcart" method="post" id="bus">
								<table width="100%" border="0" >
									<input type="hidden" name="action" value="editbus">
									<c:choose>
										<c:when test="${empty goods}">
											<div align="left">
												<br/>
												<span>您的购物车还是空的，看看其他商品吧</span>
												<p>
												<jsp:include page="recommend.jsp"/>
											</div>
										</c:when>
										<c:otherwise>
											<c:forEach items="${goods}" var="tempgood" varStatus="status">
												<input type="hidden" id="gid" name="gid">
												<input type="hidden" id="gid${status.index}" name="gid${status.index}"
													value="${tempgood.good.gid}">
												<input type="hidden" id="number" name="number">
												<tr align="center">
													<th width="180px">
														<a id="img-link" 
															href="goods?sid=${tempgood.good.gid}&action=goodslist-select"><img
																src="image/${tempgood.good.gphoto}" width="50px" height="50px" border="0">
														</a>
													</th>
													<th width="200px" align="left">
														<a href="goods?sid=${tempgood.good.gid}&action=goodslist-select">
															${tempgood.good.gname}
														</a>
														<br>
														${tempgood.good.described}
														<br>
														型号： ${tempgood.good.types}
													</th>
													<th width="100px">
														${tempgood.good.price}
													</th>
													<th width="150px">
														<input id="number${status.index}" name="${status.index}" class="number"
															value="${tempgood.number}" size="5" maxlength="5">
													</th>
													<th width="100px">
														<font color="red" style="font-family: Arial">${tempgood.good.price*tempgood.number}</font>
													</th>
													<th width="150px" style="text-align: left">
														<a href="shoppingcart?gid=${tempgood.good.gid}&number=${tempgood.number}&action=good">立即购买<a/>
														<a href="shoppingcart?action=deletebus&gid=${tempgood.good.gid}">删除<a/><br>
													</th>
												</tr>
												</c:forEach>
												<tr>
													<td colspan="6" align="right"><br>
														商品总价(不含运费)：
														<span>${countPrice}</span> 元
													</td>
												</tr>
												<tr>
													<td colspan="6" align="left"><br>
														<a href="shoppingcart?action=deleteall">删除全部</a>
													</td>
												</tr>
												<tr>
													<td colspan="6" align="right">
														<a id="img-link" class="active-buy" href="shoppingcart?action=payall"><img
																src="image/buyallbtn.jpg" border="0"> </a>
													</td>
												</tr>
										</c:otherwise>
									</c:choose>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="foot">
				<jsp:include page="foot.jsp"/> 
			</div>
		</div>
	</body>
</html>
