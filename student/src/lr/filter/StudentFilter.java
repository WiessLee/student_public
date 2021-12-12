package lr.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lr.bean.User;

@WebFilter({"/Stuindex.jsp","/StuLeft.jsp","/ShowGrade.jsp","/StuUpdate.jsp"
	,"/ShowStuCourse.jsp","/StuServlet"})
public class StudentFilter implements Filter {

    public StudentFilter() {
    	
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		User u=new User();
		if((User)req.getSession().getAttribute("user")!=null){
			u=(User)req.getSession().getAttribute("user");
		}
		if(u.getId()!=1){
			resp.sendRedirect("Login.jsp");
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
