package com.eshore.factory;

import com.eshore.dao.ShoppingCartDao;
import com.eshore.dao.GoodDao;
import com.eshore.dao.UserDao;
import com.eshore.service.ShoppingCartService;
import com.eshore.service.GoodService;
import com.eshore.service.UsersService;

public class DAOFactory {
	//取得Good业务操作类
	public static GoodDao getGoodDAOInstance()throws Exception {   
        return new GoodService();   
    } 
	//取得shoppingcart业务操作类
	public static ShoppingCartDao getShoppingCartDAOInstance()throws Exception {   
        return new ShoppingCartService(); 
    }
	//取得用户业务操作类
	public static UserDao getUserDAOInstance()throws Exception {   
        return new UsersService();    
    }
}
