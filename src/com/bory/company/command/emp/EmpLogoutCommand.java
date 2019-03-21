package com.bory.company.command.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bory.company.command.common.AbstractCommand;
import com.bory.company.pool.Constants;

public class EmpLogoutCommand extends AbstractCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		request.getSession().removeAttribute("userid");
		request.setAttribute("redirectUrl", "/company/empList.do");
		request.setAttribute("message", "로그아웃 되었습니다.");
		
		return Constants.REDIRECT_VIEW;
	}

}
