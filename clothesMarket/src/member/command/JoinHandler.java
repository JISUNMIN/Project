package member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import common.command.CommandHandler;
import member.dao.MemberDAO;
import member.dto.MemberVO;

public class JoinHandler implements CommandHandler {

	/*
	 * 개인정보 보호법
	 * -개인정보를 홈페이지에서 암호화해서 저장
	 * -운영자도 개인정보를 알수없음
	 * -회원관리:회원가입할때,개인정보(암호)를 받고 저장 이때 암호화를 하여 저장
	 * -로그인 할 때 사용자가 입력한 비밀번호와 데이터베시으에 저장된 암호화된 비밀번호 비교를 한다.
	 * -HASH함수:일방향성 y=f(x) x->y를 구할수 있지만, y->x를 구할수는 없다
	 * x:사용자가 알고있는 비밀번호 y:데이터베이스에 저장된 암호화된 값
	 * y=SHA256(x)->Bcrypt(y,seed)
	 * z->x를 알아낼수 없음
	 * x->z
	 * 1234->y=SHA256(x)=abcde->z:Bcrypt(y,seed)1a6de
	 * 1234->y=SHA256(x)=abcde->z:BCrypt(y,seed)=feghx
	 * 1234->SHA256(x) y=abcde
	 * 1234->SHA256(x) y=abcde
	 * -z값을 저장하기 위해서 60바이트 크기가 필요
	 * -기존에 저장된 암호화되지 않은 비밀번호를 암호화하여 저장하는 동작을 수행해 주어야 함
	 */
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return "joinForm.jsp";
		}
		else if(request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		}
		else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		String url = "loginForm.jsp";
		//Filter에서 수행하므로 불필요함->생략
//		try {
//			request.setCharacterEncoding("UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day= request.getParameter("day");
		String grade = request.getParameter("grade");
		if(month.length() ==1) {
			month="0"+month;
		}
		if(day.length()==1) {
			day="0"+day;
		}
		String birth=year+month+day;
		MemberVO mVo = new MemberVO();
		mVo.setName(name);
		mVo.setUserid(userid);
		mVo.setPwd(pwd);
		mVo.setEmail(email);
		mVo.setAddress(address);
		mVo.setPhone(phone);
		mVo.setBirth(birth);
		mVo.setGrade(Integer.parseInt(grade));
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.insertMember(mVo);
		HttpSession session = request.getSession();
		if (result == 1) {
			session.setAttribute("userid", mVo.getUserid());
			request.setAttribute("message", "님 회원 가입에 성공했습니다.환영합니다! 로그인후 이용해주세요");
		} else {
			request.setAttribute("message", "회원 가입에 실패했습니다.");
			url = "joinForm.jsp";
		}
		return url;
	}
}
