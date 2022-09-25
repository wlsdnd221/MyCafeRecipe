<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdnB3.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>

<div class="container">
  <h2>
  <c:choose>
  	<c:when test="${cafename eq 'starbucks'}">
  	<b>Starbucks</b>
  	</c:when>
  	<c:when test="${cafename eq 'hollys'}">
  	<b>Hollys</b>
  	</c:when>
  	<c:when test="${cafename eq 'ediya'}">
  	<b>EDIYA</b>
  	</c:when>
  </c:choose>
  </h2>
  	<br>

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#beverage">음료</a></li>
    <li><a data-toggle="tab" href="#food">푸드</a></li>
    <li><a data-toggle="tab" href="#topping">토핑</a></li>
    <c:choose>
      	<c:when test="${logon == true && mbdto != null}">
		    <p style="text-align: right">
		    	<a href="cafe_menu_input">
		    		<button class="w3-button w3-brown">상품등록</button>
		    	</a>
		    </p>
	    </c:when>
    </c:choose>
  </ul>
  
  <div class="tab-content">
    
    <div id="beverage" class="tab-pane fade in active">
	  <c:choose>
	  	<c:when test="${empty beverage}">
	  		<div style="text-align: center">
		  		<h3 align="center">준비중입니다.</h3>
		  		<img src="/recipe/image/normal/muffin.png" width="500" height="500">
	  		</div>
	  	</c:when>
		<c:otherwise>	  	
	  	<div class="container">
	  		<div class="row">
	  			<c:forEach items="${beverage}" var="b">
				    <div class="col-md-3">
				      <div class="thumbnail">
				        <a href="cafe_menu_detail?num=${b.num}">
				          <img src="/recipe/image/${b.cafe}/${b.picture}" style="width:300px; height: 300px">
				          <div class="caption" style="text-align: center">
				            <p style="text-align: center">${b.product}</p>
				          </div>
				        </a>
				      </div>
					</div>
	  			</c:forEach>
		    </div>
	  	</div>
	  </c:otherwise>
	  </c:choose>  
    </div>
    
    <div id="food" class="tab-pane fade">
      <c:choose>
	  	<c:when test="${empty food}">
	  		<div style="text-align: center">
		  		<h3>준비중입니다.</h3>
		  		<img src="/recipe/image/normal/muffin.png" width="500" height="500">
	  		</div>
	  	</c:when>
		<c:otherwise>	  	
	  	<div class="container">
	  		<div class="row">
	  			<c:forEach items="${food}" var="f">
				    <div class="col-md-3">
				      <div class="thumbnail">
				        <a href="cafe_menu_detail?num=${f.num}">
				          <img src="/recipe/image/${f.cafe}/${f.picture}" style="width:300px; height: 300px">
				          <div class="caption" style="text-align: center">
				            <p style="text-align: center">${f.product}</p>
				          </div>
				        </a>
				      </div>
					</div>
	  			</c:forEach>
		    </div>
	  	</div>
	  </c:otherwise>
	  </c:choose>  
    </div>
  
    <div id="topping" class="tab-pane fade">
      <c:choose>
	  	<c:when test="${empty topping}">
	  		<div style="text-align: center">
		  		<h3>준비중입니다.</h3>
		  		<img src="/recipe/image/normal/muffin.png" width="500" height="500">
	  		</div>
	  	</c:when>
		<c:otherwise>	  	
	  	<div class="container">
	  		<div class="row">
	  			<c:forEach items="${topping}" var="t">
				    <div class="col-md-3">
				      <div class="thumbnail">
				        <a href="cafe_menu_detail?num=${t.num}">
				          <img src="/recipe/image/${t.cafe}/${t.picture}" style="width:300px; height: 300px">
				          <div class="caption" style="text-align: center">
				            <p style="text-align: center">${t.product}</p>
				          </div>
				        </a>
				      </div>
					</div>
	  			</c:forEach>
		    </div>
	  	</div>
	  </c:otherwise>
	  </c:choose>  
    </div>
    
  </div>
</div>

</body>
</html>