package manager.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.command.CommandHandler;

public class ManagerMainHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		// TODO Auto-generated method stub
		//관리자를 구분할 때 사용
				request.setAttribute("type", new Integer(0));
				return "/manager/managerMain.jsp";//응답페이지
	}

	
}