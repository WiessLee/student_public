package lr.servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lr.bean.UserManager;

public class AdminServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AdminServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		String key="";
		PrintWriter out=response.getWriter();
		if(request.getParameter("key")!=null){
			key=request.getParameter("key");
		}
		if(key.equals("delete")){
			String Cnum=request.getParameter("Cnum");
			String Mnum=request.getParameter("Mnum");
			new UserManager().TcmDelete(Cnum, Mnum);
			request.getRequestDispatcher("ShowTcm.jsp").forward(request, response);
		}
		if(key.equals("jie")){
			String Mnum_cnum=request.getParameter("Mnum_cnum");
			new UserManager().Cure_stateLock(Mnum_cnum,1);
			request.setAttribute("Mnum_cnum",Mnum_cnum);
			request.getRequestDispatcher("Show.jsp").forward(request, response);
		}
		if(key.equals("suo")){
			String Mnum_cnum=request.getParameter("Mnum_cnum");
			new UserManager().Cure_stateLock(Mnum_cnum,0);
			request.setAttribute("Mnum_cnum",Mnum_cnum);
			request.getRequestDispatcher("Show.jsp").forward(request, response);
		}
		if(key.equals("show")){
			String Mnum_cnum=request.getParameter("Mnum_cnum");
			out.println("<script>window.open('Show.jsp?Mnum_cnum="+Mnum_cnum+"','newframe','width=600,height=<?php echo $sum;?>,left=100,top=100,menubar=no,toolbar=no,location=no,scrollbars=no')</script>");
			out.println("<script>history.go(-1);</script>");
		}
		out.println("<h1>请求超时！</h1><a href='admin.jsp'>点此返回</a>");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		String key=request.getParameter("key");
		if(key.equals("tcmadd")){
			String Tnum=request.getParameter("Tnum");
			String Cnum=request.getParameter("Cnum");
			String Mnum=request.getParameter("Mnum");
			new UserManager().TcmAdd(Tnum, Cnum, Mnum);
			request.getRequestDispatcher("TcmAdd.jsp").forward(request, response);
		}
		if(key.equals("create")){
			new UserManager().CerateGrade();
			request.getRequestDispatcher("TcmAdd.jsp").forward(request, response);
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
