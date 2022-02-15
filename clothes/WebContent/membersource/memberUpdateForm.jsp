<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<c:url value="/js/birth.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/member.js" />"></script>
<meta charset="UTF-8">
<title>정보변경 폼</title>
</head>
<body>
	<h2>변경 정보 입력</h2>
	<hr>
	<br>
	<br>
	<br>

	<hr>
	<form action="update.do" method="post" name="frm">
		<input type="hidden" name="userid" value="${mVo.userid}">
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" id="email"
					value="${mVo.email}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" id="address"
					value="${mVo.address}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" id="phone"
					value="${mVo.phone}"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><select id="year" name="year">
						<option>${mVo.birth.substring(0,4)}</option>
				</select> <select id="month" name="month">
						<option>${mVo.birth.substring(4,6)}</option>
				</select> <select id="day" name="day">
						<option>${mVo.birth.substring(6,8)}</option>
						<!-- <option value="${mVo.birth.substring(6,8)}" selected="selected"> -->
				</select></td>
			</tr>
		</table>
		<hr>
		<span> <input type="submit" value="변경하기" onclick="return updateCheck();">
		<input type="reset" value="취소">
		</span> <br>
	</form>
</body>
</html>