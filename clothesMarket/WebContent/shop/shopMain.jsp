<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="/clothes/css/style.css"/>
<link rel="stylesheet" href="/clothes/css/header.css"/>
<script src="<c:url value='/js/jquery-1.11.0.min.js'/>"></script>
<script src="/clothes/member/login.js"></script>
<script type="text/javascript" src="<c:url value="/common/common.js"/>"></script>
<link rel="stylesheet" href="css/style.css"/>

<link rel="stylesheet" href="css/shop.css"/>

<div id="header"></div>
<c:if test="${empty sessionScope.id}">
  <div id="lStatus">
     <ul>
        <li><a href="/clothes/loginForm.do">로그인</a>
        <li><a href="/clothes/manager/managerLoginForm.do">관리자 로그인</a>
        <li><a href="/clothes/registerForm.do">회원가입</a>
     </ul>
  </div>
</c:if>
<c:if test="${!empty sessionScope.id}">
	<div id="info">
		<table>
        	<tr height="10">
            	<td><button id="uLogout">로그아웃</button></td>
                <td><form id="cartForm" method="post" action="/clothes/cartList.do">
                   	<input type="hidden" name="buyer" value="${sessionScope.id}">
                   	<input type="submit" name="cart" value="장바구니"></form></td>
                <td><form id="buyForm" method="post" action="/clothes/buyList.do">
                   	<input type="hidden" name="buyer" value="${sessionScope.id}">
                   	<input type="submit" name="buy" value="구매내역"></form></td>
            </tr>
        </table>
	</div>       
</c:if> 

<div id="cata" class="box2">
	<ul>
    	<li><a href="/clothes/list.do?clothes_kind=100">상의</a>
    	<li><a href="/clothes/list.do?clothes_kind=200">하의</a>
    	<li><a href="/clothes/list.do?clothes_kind=300">신발</a>
   		<li><a href="/clothes/list.do?clothes_kind=all">전체</a>
  	</ul>
</div>

<div id="shop" class="box2">
	<c:forEach var="clothesList" items="${clothesLists}">
    	<c:set var="clothes_kind" value="${clothesList[0].getClothes_kind()}"/>
    	<c:if test="${clothes_kind=='100'}">
      		<c:set var="clothes_kindName" value="상의"/>
    	</c:if>
    	<c:if test="${clothes_kind=='200'}">
      		<c:set var="clothes_kindName" value="하의"/>
    	</c:if>
    	<c:if test="${clothes_kind=='300'}">
      		<c:set var="clothes_kindName" value="신발"/>
    	</c:if>
    	
    	<p class="b">[${clothes_kindName}] 분류의 신규 옷 목록:<a href="/clothes/list.do?clothes_kind=${clothes_kind}">더보기</a></p>
    	<c:forEach var="clothes" items="${clothesList}">
     		<table class="vhcenter">
      			<tr height="30"> 
        			<td rowspan="1"  width="100">
          				<a href="/clothes/clothesContent.do?clothes_id=${clothes.getClothes_id()}&clothes_kind=${clothes.getClothes_kind()}">
             			<img src="/clothes/clothesImage/${clothes.getClothes_image()}" class="listimage"></a></td>
        			<td width="350" class="vhcenter">
          				<a href="/clothes/clothesContent.do?clothes_id=${clothes.getClothes_id()}&clothes_kind=${clothes.getClothes_kind()}" class="b">
              			${clothes.getClothes_title()}</a></td>
        			<td rowspan="4" width="100">
          				<c:if test="${clothes.getClothes_count()==0}">
           			 		일시품절
          				</c:if>
          				<c:if test="${clothes.getClothes_count()!=0}">
            				구매가능
          				</c:if>
       				</td>      
       			</tr>
       			<tr height="30">
        			<td width="350">
        				<c:set var="price" value="${clothes.getClothes_price()}"/>
        			</td>
        		</tr> 
     		</table>
   	 	</c:forEach>
    	<br>
  	</c:forEach>
</div>