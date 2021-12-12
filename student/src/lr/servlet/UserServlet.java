package lr.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lr.bean.User;
import lr.bean.UserManager;

public class UserServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		String key="";
		if(request.getParameter("key")!=null){
			key=request.getParameter("key");
		}
		if(key.equals("exit")){
			request.getSession().setAttribute("user", null);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=GBK");
		String key=request.getParameter("key");
		PrintWriter out=response.getWriter();
		if(key.equals("select")){
			String num=request.getParameter("num");
			String pass=request.getParameter("pass");
			String id=request.getParameter("ID");
			UserManager um=new UserManager();
			User result=um.login(num,pass,id);
			if(result.getId()==0){
				out.println("<script>alert('’À∫≈ªÚ√‹¬Î¥ÌŒÛ£°');history.go(-1);</script>");
			}else{
				request.getSession().setAttribute("user", result);
			}
			if(result.getId()==1){
				request.getRequestDispatcher("Stuindex.jsp").forward(request, response);
			}
			if(result.getId()==2){
				request.getRequestDispatcher("Teaindex.jsp").forward(request, response);
			}
			if(result.getId()==3){
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
		}
	}

	public void init() throws ServletException {
		
	}

}
