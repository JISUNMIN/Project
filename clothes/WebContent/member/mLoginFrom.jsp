<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>관리자 로그인</title>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="<c:url value="/js/member.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
</head>
<style>
#first_line{width: 70%}
#second_line{width: 75%}
#id{  
    width:400px;
    height: 51px;
    margin-left: 37%;
    margin-top: 4%;
    background: #FFFFFF 0% 0% no-repeat padding-box;
    border: 1px solid #707070;}
    
 #pwd{
    width:400px;
    height: 51px;
    margin-top: 2%;
    margin-left: 37%;
    background: #FFFFFF 0% 0% no-repeat padding-box;
    border: 1px solid #707070;    
    }
#login{
    width: 100px;
    height: 120px;
    position:absolute;
    top:52%;
    left: 60%;
}
table{
    margin-left: 30%;
    margin-top: 2%;
}
span{
    margin-left: 40%;
}
h2{
    text-align: center;
    margin-right: 2%;
}


</style>
<body>
    <div id="header"></div>
    <div id="status">
        <h2>관리자 로그인</h2>
        <br>
        <hr id=first_line>
        <form action="login.do" method="post"name="frm">
        <table>
        	<tr>
          <td><input type="text" name="id" id="id" placeholder="ID"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" id="pwd" placeholder="PASSWORD"></td>
			</tr>
			<tr>
                <td><input type="submit" value="관리자로그인" id="login"onclick="return loginCheck()"></td>
			</tr>
		</table>
	</form> 
		<span>${param.name}${message}</span>
     </div>
     <br>
     <br>
     <br>
     <br>
     <br>
     <br>
     <br>
     <br>
     <hr id="second_line">
     <div id="footer"></div>
</body>
</html>