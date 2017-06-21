package com.eshore.action.shoppingcart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eshore.action.Action;
import com.eshore.factory.DAOFactory;
import com.eshore.pojo.ShoppingCart;

public class PayAction implements Action {

	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//获得参数flag标识
		String flag = request.getParameter("flag");
		//获取登录用户的ID
		String uids = String.valueOf(request.getSession().getAttribute("uid"));
		int uid = Integer.parseInt(uids);
		if(flag.equals("payall")){//支付全部
			String shopcartId = request.getParameter("shopcartId");//获得所有购物车的ID
			try{
				if (DAOFactory.getShoppingCartDAOInstance().
						updateShopcarts(shopcartId, 1) != 0) {//更新购物车中的状态
					request.setAttribute("status", "交易成功!您可以继续选购宝贝。");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{//支付单个商品
			int gid = Integer.parseInt(String.valueOf(request
					.getParameter("gid")));//获得商品的ID
			int number = Integer.parseInt(String.valueOf(request
					.getParameter("number")));//获得购买商品的数量
			try{
				ShoppingCart bus = DAOFactory.getShoppingCartDAOInstance().
						getGoodsId(uid, gid, 0);//获得指定的购物车
				if (DAOFactory.getShoppingCartDAOInstance().
						updatebus(bus.getId(), number, 1) != 0) {//更新购物车中的状态
					request.setAttribute("status", "交易成功!您可以继续选购宝贝");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return "index.jsp";
	}

}
