<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    html,body{
         margin:0; width:100%;  } 
    div{
        min-height: 100%;
         overflow:hidden;
         text-overflow:ellipsis;
    }
   footer{
    display: flex;
    position: relative;  
    bottom:1%;
    left: 15%;
    width: 70%;
    height: 200px;
    background: #FFFFFF 0% 0% no-repeat padding-box;
    border: 1px solid #707070;
    }
    #first{
     width: 50%;
    padding-left: 3%;
    padding-right: 5%;
    }
    #second{
    font: normal normal normal 20px/30px Segoe UI;
    width: 35%;
    padding-right: 3%;
    padding-top: 0.5%;
    color: #707070;
    }
    #last{
    width: 70%;
    order:3;
    font: normal normal normal 10px/28px Segoe UI;
    padding-right: 5%;
    color: #707070;
    }
    
    #first h1{
    margin-top: 0;
    font: normal normal normal 33px/72px Segoe UI;
    color: #707070;
    }
    #first p{
    text-align: left;
    margin-top: 0;
    font: normal normal normal 15px/25px Segoe UI;
    color: #707070; 
    } 
</style>
</head>
<body>  
    <div>
		<footer>
			<section id="first">
				<h1>070-0000-0000</h1>
				<br>
				<p>MON-FRI AM 10:00 ~ PM 17:00
					LUNCH TIME PM 12:00 ~ PM 13:00
					SAT,SUN, HOLIDAY CLOSED</p>
			 </section>
			 <section id="second">
				<p>국민은행000000-00-000000
					신한은행0000-000-000000           
				  <br><br> 예금주 : 클로즈마켓</p>
			</section>
			<section id="last">
				<p>상호명: 클로즈마켓 대표자 클로즈 대표전화070-8095-5771
					개인정보관리책임자김은선(marketmail@naver.com)
					통신판매업신고2021-경기오산-1111호
					사업자등록번호121-11-00011 [사업자정보확인]
					주소18131 경기도 오산시 현충로 111-11 (부산동)
					[교환&반품주소] 서울특별시 동작구 보라매로5길 15
					 (신대방동,전문건설회관) 결제대금예치업 등록번호
					00-000-00000 [서비스가입사실확인]
					©클로즈마켓 ALL RIGHT RESERVED.</p>
			</section>
		</footer>
    </div>
</body>
</html>