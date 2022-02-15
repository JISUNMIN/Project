<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>회원가입 폼</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="<c:url value="/js/member.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/birth.js"/>"></script>
</head>
<style>
h2{
    text-align: center;
}
table{
    border-collapse: collapse;
    margin-left: 350px;
}
form{
    text-align: center;
}
#first_first{
    border-top:1px solid  #707070;;
}
td{
    padding: 10px;
}
tr{
    border-bottom: 1px solid  #707070;
}
.td_first{
    border-right: 1px solid  #707070;
}
th:first-child,td:first-child{
    border-left: none;
}
#join{
    margin-top: 20px;
    margin-right: 10px;
}
#id_check{
   margin-right: 480px;
}
#pwd_check{
    margin-right:10px;
}
</style>
<body>
<div id="header"></div>
<div>
    <h2>회원가입</h2>
	<br>
	<form action="join.do" method="post" name="frm">
		<table>
			<tr id="first_first">
				<td class="td_first">이름</td>
				<td><input type="text" name="name" id="name"></td>
				<td ><label for="name">한글로 5자이내로 입력해주세요</label></td>
			</tr>
			<tr>
				<td class="td_first">아이디</td>
				<td><input type="text" name="userid" id="userid" size="20">
					<input type="hidden" name="reid"></td>
				<td><input type="button" id="id_check" value="중복확인" onclick="idCheck()"></td>
			</tr>
			<tr>
				<td class="td_first">비밀번호</td>
				<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력"></td>
				<td><input type="password" name="pwd_check" id="pwd_check"
					placeholder="비밀번호 확인">영문,숫자,특수문자를 조합하여 8~20자 이내로 입력</td>
			</tr>
			<tr>
				<td class="td_first">이메일</td>
				<td><input type="email" name="email" id="email"></td>
         
			</tr>
			<tr>
				<td class="td_first">주소</td>
				<td><input type="text" name="address" id="address"></td>
			</tr>
			<tr>
				<td class="td_first">전화번호</td>
				<td><input type="text" name="phone" id="phone"></td>
			</tr>
			<tr>
				<td class="td_first">생년월일</td>
				<td><select id="year" name="year" id="year" required>
						<option value="">연도</option>
				</select> <select id="month" name="month"required>
						<option value="">월</option>
				</select> <select id="day" name="day"required>
						<option value="">일</option>
				</select></td>
			</tr>
			<tr>
				<td class="td_first">등급</td>
				<td><input type="radio" id="normal" name="grade" value="0"
					checked="checked"> <label for="normal">일반회원</label> <input
					type="radio" id="admin" name="grade" value="1"> <label
					for="admin">관리자</label></td>

		</table>
		<span> <input id="join" type="submit" value="가입하기"
			onclick="return joinCheck();"> <input type="reset" value="취소"
			onclick="location.href='loginForm.jsp'">
		</span>
		<br>
		<br>
		<span>${message}</span>
	</form>
    <div id="footer"></div>
</div>
</body>
</html>