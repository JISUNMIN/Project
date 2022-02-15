<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 페이지</title>
</head>
<%-- 서블릿을 사용해서 홈페이지를 만들 경우
	url은 .jsp 확장자를 사용하면 안된다. : 철칙 (반드시 지켜야 할 원칙)
	joinPro, join.do url을 사용
 --%>
<body>
 	<a href="<c:url value="/member/login.do" />">로그인 페이지로 이동</a>
</body>
</html>