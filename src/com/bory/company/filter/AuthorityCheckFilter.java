package com.bory.company.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bory.company.pool.Constants;

public class AuthorityCheckFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userid")==null ||session==null ) {
			request.setAttribute("redirectUrl", request.getContextPath() +"/empList.do");
			request.setAttribute("message", "로그인이 필요한 서비스입니다.");
			request.getRequestDispatcher(Constants.REDIRECT_VIEW).forward(request, response);
		}else {
			chain.doFilter(request, response);
		}		
	}

}
