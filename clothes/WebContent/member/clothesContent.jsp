<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>상품 상세페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script type="text/javascript" src="<c:url value="/js/member.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/js/common.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/js/birth.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/shop/clothescontent.js"/>"></script>
   <script type="text/javascript" src="<c:url value="/js/jquery.bxslider.min.js"/>"></script>
</head>
<style>
#showClothes{
margin-left:15%; 
}

#clothes_img{
margin-left:45%;
margin-top:10%;
border:1px solid black;
}
#dec{
border:1px solid black;
background:gray;
width:800px;
height:1000px;
margin-left:30%;}

#second_line{
width:65%;}

#showQna{
text-align:center;
}
#qna{
font: normal normal normal 30px/53px Segoe UI;
color: #707070;
}
#bxbox{
position:absolute;
top:480px;
left:27%;
}
.bx-wrapper img {
    height:100px;
} 
</style>
<body>
    <div id="header"></div>      
      <div id="showClothes">
        <table class="vhcenter"> 
         <tr height="30"> 
           <td id="img" rowspan="6"  width="500">
           <img src="<c:url value="/images/a.png"/>" id="clothes_img"></td>
             <!-- <img src="/clothes/clothesImage/${clothes.getClothes_image()}" class="contentimage"></td>  --> 
           <td width="500">
           <br><br>
             <b>${clothes.getClothes_title()} 상품명</b><hr></td>
         </tr> 
          <tr><td width="500"><b>판매가:</b><c:set var="price" value="${clothes.getClothes_price()}"/>
         <tr><td width="500">
      
           <c:if test="${!empty sessionScope.id}">
             <c:if test="${clothes.getClothes_count()==0}">
               <p>일시품절
             </c:if>
             <c:if test="${clothes.getClothes_count()>=1}">
               수량 : <input type="text" size="5" id="buy_count" value="1"> 개
             </c:if>
             <input type="hidden" id="clothes_id" value="${clothes_id}">
             <input type="hidden" id="clothes_image" value="${clothes.getClothes_image()}">
             <input type="hidden" id="clothes_title" value="${clothes.getClothes_title()}">
             <input type="hidden" id="clothes_price" value="${clothes_price}">
             <input type="hidden" id="clothes_kind" value="${clothes_kind}">
             <input type="hidden" id="buyer" value="${sessionScope.id}">              
             <button id="insertCart">장바구니에 담기</button>
           </c:if>
           <c:if test="${empty sessionScope.id}">
             <c:if test="${clothes.getClothes_count()==0}">
               <p>일시품절
             </c:if>
             <p>제품을 구매하시려면 로그인 하세요.
           </c:if>
           <button id="list">목록으로</button>
           <button id="shopMain">메인으로</button>
         </td>
        </tr>  
               
        <tr class="ch">
          <td colspan="2" class="hleft">${clothes.getClothes_content()}</td>
       </tr> 
      </table>
       <br><br><br><br>
      </div>
      <hr id="second_line"><br><br>
      <div id="bxbox">
          	<ul class="bxslider"> 
    		<li><img src="<c:url value="/images/b.png"/>"> </li>
    		<li><img src="<c:url value="/images/b.png"/>"> </li> 
    		<li><img src="<c:url value="/images/b.png"/>"> </li> 
		   </ul> 
		 </div>
      <div id="dec">
      </div>
	<div id="showQna">
		<p class="b">
			<span id="qna">상품QnA</span>
			<c:if test="${!empty sessionScope.id}">
				<button id="writeQna">상품QnA쓰기</button>
			</c:if>
			<c:if test="${empty sessionScope.id}">
				<p>상품QnA를 쓰실려면 로그인 하세요.</p>
			</c:if>
		</p>
		<c:if test="${count == 0}">
			<ul>
				<li>등록된 상품QnA가 없습니다.
			</ul>
		</c:if>
		<c:if test="${count > 0}">
			<c:forEach var="qna" items="${qnaLists}">
				<ul>
					<li><c:set var="writer" value="${qna.getQna_writer()}" />
						${fn:substring(writer, 0, 4)}**** <small class="date">(${qna.getReg_date()})</small>
					<li>${qna.getQna_content()}
					<li><c:if test="${sessionScope.id==writer}">
							<button id="edit" name="${qna.getQna_id()},${clothes_kind}"
								onclick="edit(this)">수정</button>
							<button id="delete"
								name="${qna.getQna_id()},${clothes_id},${clothes_kind}"
								onclick="del(this)">삭제</button>
						</c:if>
				</ul>
			</c:forEach>
		</c:if>
	</div>
	<div id="footer"></div>     
</body>
</html>