<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
<script type="text/javascript" src="<c:url value="/js/member.js"/>"></script>
</head>
<body>
    <h1>마켓클로즈</h1>
	<h2>회원로그인</h2>
	<br>
	<hr>
	<form action="login.do" method="post"name="frm">
		<table>
			<tr>
				<td><input type="text" name="userid" id="userid" placeholder="아이디를 입력하세요!"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요!"></td>
			</tr>
			<tr>
				<td><input type="reset" value="취소"> <input
					type="button" value="회원 가입" onclick="location.href='join.do'"></td>
			</tr>
			<tr>
				<td><ipnut type="submit" value="로그인" style="padding:15px;position:absolute; top:180px; left:185px"onclick="return loginCheck()">
				</td>
				</tr>
		</table>
	</form> 
		<span>${param.name}${message}</span>
</body>
</html>