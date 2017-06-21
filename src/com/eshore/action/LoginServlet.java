package com.eshore.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eshore.factory.DAOFactory;
import com.eshore.pojo.Users;

@WebServlet(
	urlPatterns = { "/login" }, 
	name = "loginServlet" 
)
public class LoginServlet extends HttpServlet {
	 
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uname = request.getParameter("uname");//获取用户名
		String passwd = request.getParameter("passwd");//获取用户密码
		String action = request.getParameter("action");//获取action类型
		String path = null;

		try{
			if (action.equals("login")) {//如果是登录
				Users user = DAOFactory.getUserDAOInstance().
					queryByName(uname);//根据用户名查询用户
				if (passwd.equals(user.getPasswd())) {//输入的密码与数据库中的一致
					request.getSession().setAttribute("uname", uname);
					request.getSession().setAttribute("uid", user.getUid());
					path = "index.jsp";
				} else {
					request.setAttribute("status", "用户名或密码错误！");
					path = "login.jsp";
				}
			} else if (action.equals("logout")) {//用户退出，注销session中的用户
				request.getSession().removeAttribute("uname");
				request.getSession().removeAttribute("uid");
				path = "login.jsp";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
