<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript" src="<c:url value="/js/member.js" />"></script>
</head>
<body>
	<h2>아이디 중복체크</h2>
	<form action="idCheck.do" method="get"name="frm">
	아이디<input type="text" name="userid" value="${userid}">
		<input type="submit" value="중복체크">
	</form>
	<!-- 중복된 사용자:reuslt(1) -->
		<c:if test="${result == 1}">
		<script type="text/javascript">
	  opner.document.frm.userid.value="";
		</script>
		${userid}는 이미 사용중인 아이디입니다.
	</c:if>
	<!-- 사용 가능한 아이디:result(-1) -->
		<c:if test="${result==-1 }">
		${userid}은 사용 가능한 아이디입니다.
		<input type="button" value="사용" class="cancel" onclick="idok('${userid}')">
		</c:if>
</body>
</html>