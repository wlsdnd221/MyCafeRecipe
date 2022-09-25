<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="w3-container" style="width: 80%;margin-left: auto; margin-right: auto;">
  <h2><b>My
  <c:choose>
  	<c:when test="${cafename eq 'starbucks'}">
  	Starbucks
  	</c:when>
  	<c:when test="${cafename eq 'hollys'}">
  	Hollys
  	</c:when>
  	<c:when test="${cafename eq 'ediya'}">
  	EDIYA
  	</c:when>
  </c:choose>
  Recipe</b></h2>
  <br>
  <c:choose>
      	<c:when test="${logon == true && mbdto != null}">
		    <p style="text-align: right">
		    	<a href="recipe_input?cafename=${cafename}">
		    		<button class="w3-button w3-brown">글 쓰기</button>
		    	</a>
		    </p>
	   </c:when>
  </c:choose>
  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-brown">
        <th width="200">글 번호</th>
        <th>음료명</th>
        <th width="200">작성자</th>
        <th width="200">작성일</th>
        <th width="100">조회수</th>
      </tr>
    </thead>
    <c:forEach items="${lista}" var="r">
    <tr>
      <td>${r.num}</td>
      <td>
      	<c:forEach begin="1" end="${r.indent}">
      	&emsp;
      	</c:forEach>
      	<c:if test="${r.indent>0}">
      	└
      	</c:if>
      	<a href="recipe_detail?num=${r.num}">
      		${r.title}
      	</a>
      </td>
      <td>${r.writer}</td>
      <td>${r.writeday}</td>
      <td>${r.readcnt}</td>
    </tr>
    </c:forEach>
  </table>
  <br>
  
  <div id="page" class="w3-bar" style="text-align: center">
	  <button class="w3-button">&laquo;</button>
		<c:forEach begin="1" end="${totalpage}" var="i">
			<a href="recipe_list?cafename=${cafename}&pagenum=${i}">
				<button id="${i}" class="w3-button pagenum">${i}</button>
			</a>
		</c:forEach>
	  <button class="w3-button">&raquo;</button>
  </div>
  
  <form action="recipe_search?cafename=${cafename}" method="post" align="center">
  <select name="category">
  	<option value="title">음료명(제목)
  	<option value="">작성자
  </select>
  <input type="text" name="search">
  <input type="submit" value="검색">
  </form>
</div>

</body>
</html>