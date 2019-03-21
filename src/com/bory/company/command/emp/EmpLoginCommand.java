package com.bory.company.command.emp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bory.company.command.common.AbstractCommand;
import com.bory.company.dao.emp.EmpDAO;
import com.bory.company.dao.emp.EmpDAOImpl;
import com.bory.company.dto.Employee;
import com.bory.company.pool.Constants;

public class EmpLoginCommand extends AbstractCommand{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		EmpDAO empDao = new EmpDAOImpl(connection);
		Employee employee = new Employee();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		String userid = null;
		String ResponseText;
		
		if((empDao.exists("EMPNO", password)||empDao.exists("ENAME", id))){
			employee = empDao.login(id, password);
			userid = employee.getEname();
			if(userid==null) {
				ResponseText = "WRONG";
			}else {
				request.getSession().setAttribute("userid", userid);
				ResponseText = "SUCCESS";
			}
		}else {
			ResponseText = "NoExists";
		}
		
		request.setAttribute("ajaxResponse", ResponseText);
		return Constants.AJAX_VIEW;
		
		
	}

}
