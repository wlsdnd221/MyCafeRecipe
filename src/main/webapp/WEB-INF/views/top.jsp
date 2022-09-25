<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#main, #starbucks, #hollys, #ediya{display: none}
</style>

<meta charset="UTF-8">
<jsp:include page="cdnB3.jsp"/>
<title>Insert title here</title>
</head>
<body>

<header>
<h1 class="w3-text-brown" style="text-shadow:1px 1px 0 #444; height: 50px; text-align: center">
  <a href="main"><b>MyCafeRecipe</b></a>
</h1>
</header>

<script>
function openNav(evt, subNav, color) {
  var i, x, tablinks;
  x = document.getElementsByClassName("cafe");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" w3-brown", "");
    tablinks[i].className = tablinks[i].className.replace(" w3-green", "");
    tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
    tablinks[i].className = tablinks[i].className.replace(" w3-blue", "");
  }
  document.getElementById(subNav).style.display = "block";
  evt.currentTarget.className += color;
}
</script>

<!-- 네비바 -->
<nav class="navbar navbar-inverse">
  <!-- 메인 네비바 -->
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand w3-hover-brown tablink" onclick="openNav(event, 'main', ' w3-brown')">MyCafeRecipe</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a class="w3-bar-item w3-hover-green tablink" onclick="openNav(event, 'starbucks', ' w3-green')">스타벅스</a></li>
      <li><a class="w3-bar-item w3-hover-red tablink" onclick="openNav(event, 'hollys', ' w3-red')">할리스</a></li>
      <li><a class="w3-bar-item w3-hover-blue tablink" onclick="openNav(event, 'ediya', ' w3-blue')">이디야</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <c:choose>
      	  <c:when test="${logon == true && mbdto != null}">
		    <li><a href="#">${mbdto.name}님 환영합니다. <span class="glyphicon glyphicon-user"></span></a></li>
		    <li>
		      	<a href="logout">
		      		로그아웃 <span class="glyphicon glyphicon-log-in"></span>
		      	</a>
		      </li>  
	      </c:when>
	      <c:otherwise>
	      	<li><a href="application_form"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
		      <li>
		      	<a href="#" onclick="document.getElementById('id01').style.display='block'">
		      		<span class="glyphicon glyphicon-log-in"></span> 로그인
		      	</a>
		      </li>
	      </c:otherwise>
      </c:choose>
    </ul> 
  </div>
  <!-- 메인 네비바 종료 -->
   	  <!-- 서브 네비바 --> 
	  <div id="main" class="container-fluid w3-brown cafe">
		<ul class="nav navbar-nav">
		  <li><a href="main" class="w3-btn w3-brown w3-round-large">홈</a></li>
		  <li><a href="guide" class="w3-btn w3-brown w3-round-large">이용안내</a></li>
		  <li><a href="notice_list?pagenum=1" class="w3-btn w3-brown w3-round-large">공지사항 & 이벤트</a></li>
		</ul>
	  </div>

	  <div id="starbucks" class="container-fluid w3-green cafe">
		<ul class="nav navbar-nav">
		   <li><a href="cafe_menu_list?cafename=starbucks" class="w3-btn w3-green w3-round-large">메뉴</a></li>
		   <li><a href="recipe_list?cafename=starbucks&pagenum=1" class="w3-btn w3-green w3-round-large">나만의 레시피</a></li>
		   <li><a href="map?cafename=starbucks" class="w3-btn w3-green w3-round-large">내 주변 카페찾기</a></li>
		</ul>
	  </div>

	  <div id="hollys" class="container-fluid w3-red cafe">
		<ul class="nav navbar-nav">
		   <li><a href="cafe_menu_list?cafename=hollys" class="w3-btn w3-red w3-round-large">메뉴</a></li>
		   <li><a href="recipe_list?cafename=hollys&pagenum=1" class="w3-btn w3-red w3-round-large">나만의 레시피</a></li>
		   <li><a href="map?cafename=hollys" class="w3-btn w3-red w3-round-large">내 주변 카페찾기</a></li>
		</ul>
	  </div>

	  <div id="ediya" class="container-fluid w3-blue cafe">
		<ul class="nav navbar-nav">
		   <li><a href="cafe_menu_list?cafename=ediya" class="w3-btn w3-blue w3-round-large">메뉴</a></li>
		   <li><a href="recipe_list?cafename=ediya&pagenum=1" class="w3-btn w3-blue w3-round-large">나만의 레시피</a></li>
		   <li><a href="map?cafename=ediya" class="w3-btn w3-blue w3-round-large">내 주변 카페찾기</a></li>
		</ul>
	  </div>
	  <!-- 서브 네비바 종료 -->
</nav>
<!-- 네비바 종료 -->

<!-- 로그인 모달화면 -->
<jsp:include page="login_form.jsp"/>

<!-- 로그인 실패 알림창 -->
<c:choose>
	<c:when test="${param.loginresult == 'fail'}">
		<script type="text/javascript">
			window.onload=function(){
				alert("아이디나 비밀번호를 확인해 주세요.");
			}
		</script>
	</c:when>
</c:choose>
</body>
</html>