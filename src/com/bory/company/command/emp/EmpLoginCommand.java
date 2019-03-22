package com.bory.company.command.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bory.company.command.common.AbstractCommand;
import com.bory.company.dao.emp.EmpDAO;
import com.bory.company.dao.emp.EmpDAOImpl;
import com.bory.company.pool.Constants;

public class EmpLoginCommand extends AbstractCommand{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		EmpDAO empDao = new EmpDAOImpl(connection);
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		String userid = null;
		String ResponseText;
		
	
		userid = empDao.login(id, password).getEname();
		if(userid==null) {
			ResponseText = "아이디 또는 비밀번호를 다시 확인하세요.\n등록되지 않은 아이디이거나,\n아이디 또는 비밀번호를 잘못 입력하셨습니다.";
		}else {
			ResponseText = "SUCCESS";
			request.getSession().setAttribute("userid", userid);	
		}
		
		request.setAttribute("ajaxResponse", ResponseText);

		return Constants.AJAX_VIEW;
		
		
	}

}
