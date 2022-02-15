package member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.command.CommandHandler;
import member.dao.MemberDAO;
import member.dto.MemberVO;

public class MemberUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException,Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);
		}
		else if(request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		}
		else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}


	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		String userid=request.getParameter("userid");
		MemberDAO mDao=MemberDAO.getInstance();
		MemberVO mVo=mDao.getMember(userid);
		request.setAttribute("mVo", mVo);
		return"memberUpdateForm.jsp";
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userid=request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String year=request.getParameter("year");
		String month = request.getParameter("month");
		String day= request.getParameter("day");
		if(month.length() ==1) {
			month="0"+month;
		}
		if(day.length()==1) {
			day="0"+day;
		}
		String birth=year+month+day;
		MemberVO mVo=new MemberVO();
		mVo.setUserid(userid);
		mVo.setPwd(pwd);
		mVo.setEmail(email);
		mVo.setAddress(address);
		mVo.setPhone(phone);
		mVo.setBirth(birth);
		MemberDAO mDao=MemberDAO.getInstance();
		mDao.updateMember(mVo);
		response.sendRedirect("../index.do");
		return null;
		
	}
	

}
