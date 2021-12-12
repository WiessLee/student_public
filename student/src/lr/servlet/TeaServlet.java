package lr.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lr.bean.User;
import lr.bean.UserManager;

public class TeaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public TeaServlet() {
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
		if(key.equals("suo")){
			String Mnum_cnum=request.getParameter("Mnum_cnum");
			new UserManager().Cure_stateLock(Mnum_cnum,0);
			request.setAttribute("Mnum_cnum",Mnum_cnum);
			request.getRequestDispatcher("Gradeupdate.jsp").forward(request, response);
		}
		if(key.equals("show")){
			String Mnum_cnum=request.getParameter("Mnum_cnum");
			out.println("<script>window.open('Gradeupdate.jsp?Mnum_cnum="+Mnum_cnum+"','newframe','width=600,height=<?php echo $sum;?>,left=100,top=100,menubar=no,toolbar=no,location=no,scrollbars=no')</script>");
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
					out.println("<script>alert('ÃÜÂë´íÎó£¡');history.go(-1);</script>");
				}else{
					out.println("<script>alert('ÐÞ¸Ä³É¹¦£¬ÏÂ´ÎµÇÂ¼ÉúÐ§£¡');history.go(-1);</script>");
				}
			}else{
				out.println("<script>alert('ÃÜÂë²»ÄÜÎª¿Õ£¡');history.go(-1);</script>");
			}
		}
		if(key.equals("Grade")){
			String Stunum=request.getParameter("Stunum");
			int Core1=0;
			int Core2=0;
			int Core3=0;
			if(request.getParameter("Core1")!=""){
				Core1=Integer.parseInt(request.getParameter("Core1"));
			}
			if(request.getParameter("Core2")!=""){
				Core2=Integer.parseInt(request.getParameter("Core2"));
			}
			if(request.getParameter("Core3")!=""){
				Core3=Integer.parseInt(request.getParameter("Core3"));
			}
			if(Core1>=0&&Core1<=100&&Core2>=0&&Core2<=100&&Core3>=0&&Core3<=100){
				String Remarks=request.getParameter("Remarks");
				String Mnum_cnum=request.getParameter("Mnum_cnum");
				String table=Mnum_cnum+"_core";
				int i=new UserManager().GradeUpdate(table, Stunum, Core1, Core2, Core3,Remarks);
				if(i==0){
					out.println("<script>alert('ÐÞ¸ÄÊ§°Ü£¡');history.go(-1);</script>");
				}else{
					request.setAttribute("Mnum_cnum",Mnum_cnum);
					request.getRequestDispatcher("Gradeupdate.jsp").forward(request, response);
				}
			}else{
				out.println("<script>alert('³¬³ö·¶Î§£¡');history.go(-1);</script>");
			}
		}
	}

	public void init() throws ServletException {
		
	}

}
