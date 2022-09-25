<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdnB3.jsp"/>
<title>Insert title here</title>
</head>
<body>

<div class="container" style="width: 100%; margin: 0 auto">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
      	<c:choose>
      		<c:when test="${sbnew == null}">
      			<img src="/recipe/image/normal/muffin.png" alt="준비중입니다." style="width:100%; height: 500px">
      			<div class="carousel-caption">
			          <h3><b>상품 준비중</b></h3>
		        </div>
      		</c:when>
      		<c:when test="${sbnew != null}">
		      	<a href="cafe_menu_detail?num=${sbnew.num}">
		        	<img src="/recipe/image/starbucks/${sbnew.picture}" alt="스타벅스 신메뉴" style="width:100%; height: 500px">
		        	<div class="carousel-caption">
			          <h3><b>스타벅스</b></h3>
			          <p><b>${sbnew.product}</b></p>
		        	</div>
		        </a>
        	</c:when>
        </c:choose>
      </div>

      <div class="item">
        <c:choose>
      		<c:when test="${honew == null}">
      			<img src="/recipe/image/normal/muffin.png" alt="준비중입니다." style="width:100%; height: 500px">
      			<div class="carousel-caption">
			          <h3><b>상품 준비중</b></h3>
		        </div>
      		</c:when>
      		<c:when test="${honew != null}">
		      	<a href="cafe_menu_detail?num=${honew.num}">
		        	<img src="/recipe/image/hollys/${honew.picture}" alt="할리스 신메뉴" style="width:100%; height: 500px">
		        	<div class="carousel-caption">
			          <h3><b>할리스</b></h3>
			          <p><b>${honew.product}</b></p>
		        	</div>
		        </a>
        	</c:when>
        </c:choose>
      </div>
    
      <div class="item">
        <c:choose>
      		<c:when test="${ednew == null}">
      			<img src="/recipe/image/normal/muffin.png" alt="준비중입니다." style="width:100%; height: 500px">
      			<div class="carousel-caption">
			          <h3><b>상품 준비중</b></h3>
		        </div>
      		</c:when>
      		<c:when test="${ednew != null}">
		      	<a href="cafe_menu_detail?num=${ednew.num}">
		        	<img src="/recipe/image/ediya/${ednew.picture}" alt="이디야 신메뉴" style="width:100%; height: 500px">
		        	<div class="carousel-caption">
			          <h3><b>이디야</b></h3>
			          <p><b>${ednew.product}</b></p>
		        	</div>
		        </a>
        	</c:when>
        </c:choose>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>

<div class="container" align="left">
  <h2 class="w3-text-brown" style="text-shadow:1px 1px 0 #444; height: 50px;"><b>레시피 바로가기</b></h2>
  <div class="row">
	  <div class="col-md-4">
		  <div class="thumbnail w3-sand w3-border w3-border-brown">
			  <a href="recipe_list?cafename=starbucks&pagenum=1">
				  <div class="caption">
				 	 <p><b>스타벅스</b></p>
				  </div>
			   	  <img src="/recipe/image/normal/스타벅스로고.png" class="img-circle" style="width:300px; height: 300px">			 
			  </a>
		  </div>
	  </div>
	  <div class="col-md-4">
		  <div class="thumbnail w3-sand w3-border w3-border-brown">
			  <a href="recipe_list?cafename=hollys&pagenum=1">
				  <div class="caption">
				 	 <p><b>할리스</b></p>
				  </div>
			   	  <img src="/recipe/image/normal/할리스로고.png" class="img-circle" style="width:300px; height: 300px">			 
			  </a>
		  </div>
	  </div>
	  <div class="col-md-4">
		  <div class="thumbnail w3-sand w3-border w3-border-brown">
			  <a href="recipe_list?cafename=ediya&pagenum=1">
				  <div class="caption">
				 	 <p><b>이디야</b></p>
				  </div>
			   	  <img src="/recipe/image/normal/이디야로고.png" class="img-circle" style="width:300px; height: 300px">
			  </a>
		  </div>
	  </div>
  </div>
</div>

</body>
</html>