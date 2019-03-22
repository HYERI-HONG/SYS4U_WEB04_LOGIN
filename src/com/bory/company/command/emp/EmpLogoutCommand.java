package com.bory.company.command.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bory.company.command.common.AbstractCommand;
import com.bory.company.pool.Constants;

public class EmpLogoutCommand extends AbstractCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.getSession().removeAttribute("userid");
		
		//검색시 검색어를 URL로 보내지 않기 때문에 저장되지 않는다. 
		request.setAttribute("redirectUrl", request.getHeader("referer"));
		request.setAttribute("message", "로그아웃 되었습니다.");
		
		return Constants.REDIRECT_VIEW;
	}

}
