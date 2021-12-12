package lr.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class Encodeing implements Filter {

    public Encodeing() {
    }

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("GBK");
		chain.doFilter(request, response);
		response.setCharacterEncoding("GBK");
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
