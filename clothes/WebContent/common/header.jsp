<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    header {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 1080px;
    height: 215px;
    display: flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
  }
  fieldset {
    border: none; /* 기본 border 없애기(이 코드를 지우고 기본 border를 확인해보세요) */
  }
  .visually-hidden {
    position: absolute !important;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px, 1px, 1px, 1px);
    white-space: nowrap;
  }
  .links {
    /* 링크들을 상단 우측에 위치시킵니다. */
    position: absolute;
    top: 120px;
    left: 20px;
    
  }
  .links .link_text {
    font-size: 12px;
    margin-left: 5px;
    text-decoration:none; color:#646464;
  }
 
  .img_logo {
    top:50px;
    margin-left: 440px;
    width: 150px;
    height: 150px;
  }

  /* nav */
  header > nav {
    width: 100%;
    height: 45px;
    position: absolute;
    bottom: 0;
  }
  .nav_items {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 15px;
    font-weight: bold;
    border-top: 1px solid #f1f3f6;
  }
  
  .nav_items ul > li {
    display: inline-block;
    margin-left: 8px;
  }
  .nav_items ul > li:nth-child(-n + 7) > a {
    /* <ul>하위 7번째 <li>까지 각각 내부의 <a> 태그 접근 */
    color: #bbbbbb;
  }
  .nav_items ul > li > a {
    text-decoration: none;
    cursor: pointer;
  }
</style>
<body>
    	<!-- 헤더 영역-->
		<header>
            <div class="links">
              <a href="/" class="link_text">LOGIN</a>
              <a href="/" class="link_text">JOIN</a>
              <a href="/" class="link_text">ORDER</a>
            </div>
            <a href="/"><img src="../images/a.png" class="img_logo"/></a>         
            <nav>
              <div class="nav_items">
                <ul>
                  <li><a href="/">TOPS</a></li>
                  <li><a href="/">BOTTOMS</a></li>
                  <li><a href="/">SHOES</a></li>
               </div>
              </div>
            </nav>
          </header>
</body>
</html>