package lr.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lr.bean.User;
import lr.bean.UserManager;

public class StuServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	public StuServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		String key=request.getParameter("key");
		PrintWriter out=response.getWriter();
		if(key.equals("show")){
			String Cnum=request.getParameter("Cnum");
			String Mnum_cnum=request.getParameter("Mnum_cnum");
			String table=Mnum_cnum+"_core";
			out.println("<script>window.open('ShowGrade.jsp?table="+table+"&Cnum="+Cnum+"','newframe','width=600,height=<?php echo $sum;?>,left=100,top=100,menubar=no,toolbar=no,location=no,scrollbars=no')</script>");
			out.println("<script>history.go(-1);</script>");
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		String key=request.getParameter("key");
		PrintWriter out=response.getWriter();
		if(key.equals("update")){
			User u=(User)request.getSession().getAttribute("user");
			String pass=request.getParameter("pass");
			String newpass=request.getParameter("newpass");
			String num=u.getNum();
			if(!newpass.equals("")){
				int i=new UserManager().PassUpdate(num, pass, newpass, "tea");
				if(i==0){
					out.println("<script>alert('密码错误！');history.go(-1);</script>");
				}else{
					out.println("<script>alert('修改成功，下次登录生效！');history.go(-1);</script>");
				}
			}else{
				out.println("<script>alert('密码不能为空！');history.go(-1);</script>");
			}
		}
		
	}

	
	public void init() throws ServletException {
	}

}
