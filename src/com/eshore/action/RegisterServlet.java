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
	urlPatterns = { "/register" }, 
	name = "registerServlet" 
)
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取页面参数，包括用户名密码邮箱
		String uname = request.getParameter("uname");
		String passwd = request.getParameter("passwd");
		String email = request.getParameter("email");
		String path = null;
		//为用户设定属性值
		Users user = new Users();
		user.setUname(uname);
		user.setPasswd(passwd);
		user.setEmail(email);
		try{
			if (DAOFactory.getUserDAOInstance().
					queryByName(uname).getUid() == 0) {// 用户名可用
				if (DAOFactory.getUserDAOInstance().
						queryByEmail(email).getUid() == 0) {// 邮箱可用
					if (DAOFactory.getUserDAOInstance().addUser(user) == 1) {
						request.getSession().setAttribute("uname", uname);
						request.getSession().setAttribute("uid",
								DAOFactory.getUserDAOInstance().queryByName(uname).getUid());
						path = "index.jsp";
						request.setAttribute("status", "恭喜您，注册成功！");
					} else {
						path = "register.jsp";
						request.setAttribute("status", "注册失败，请重试……");
					}
				} else {
					path = "register.jsp";
					request.setAttribute("status", "电子邮箱已被注册");
				}
			}else{
				path = "register.jsp";
				request.setAttribute("status", "用户名已被注册");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(path).forward(request, response);
	}
}
