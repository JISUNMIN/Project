<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>회원정보 수정</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script type="text/javascript" src="<c:url value="/js/member.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/birth.js"/>"></script>
</head>
<style>
h2{
    text-align: center;
    font: normal normal normal 30px/40px Segoe UI;
    letter-spacing: 0px;
    }
hr{
    width: 40%;
} 
table{
    margin-left: 38%;
}
table td{
    font: normal normal normal 20px/33px Segoe UI;
}
input{
    width: 220px;
    height: 30px;
    background: #FFFFFF 0% 0% no-repeat padding-box;
    border: 1px solid #707070;
    text-align: center;
    margin-right: 20px;
    margin-left: 25px;
}
span{
    margin-left: 43%;
}
span input{
    width: 80px;
    height: 30px;
    margin-left: 10px;
    font: normal normal normal 15px/33px Segoe UI;
}
#year{
    width: 80px;
    height: 30px; 
}
#month,#day{
    width: 60px;
    height: 30px; 
}
table{
    border-top: 1px solid  #707070;
    border-collapse: collapse;
}
td,th{
    border-bottom: 1px solid  #707070;
    border-left: 1px solid  #707070;
    padding:10px;
}
th:first-child, td:first-child {
    border-left: none;
}
select{
    margin-left: 10px;
}
</style>
<body>
    <div id="header"></div>
    <div id="status">
        <h2>회원정보 변경</h2>
        <br>
        <br>
        <br>
    
        <form action="update.do" method="post" name="frm">
            <input type="hidden" name="userid" value="${mVo.userid}">
            <table>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력"></td>
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
            <br><span> <input type="submit" value="변경하기" onclick="return updateCheck();">
            <input type="reset" value="취소">
            </span>
            <br><br>
        </form>
    </div>
    <div id="footer"></div>
</body>
</html>