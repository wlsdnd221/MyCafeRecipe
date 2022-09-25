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

<div class="w3-container" style="width: 80%;margin-left: auto; margin-right: auto;">
  <h2><b>공지사항 & 이벤트</b></h2>
  <br>
  <c:choose>
      	<c:when test="${logon == true && mbdto != null}">
		    <p style="text-align: right">
		    	<a href="notice_input">
		    		<button class="w3-button w3-brown">글 등록</button>
		    	</a>
		    </p>
	   </c:when>
  </c:choose>
  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-brown">
        <th width="200">글 번호</th>
        <th>제목</th>
        <th width="200">작성자</th>
        <th width="200">작성일</th>
        <th width="100">조회수</th>
      </tr>
    </thead>
    <c:forEach items="${nodto}" var="n">
    <tr>
      <td>${n.num}</td>
      <td>
      	<a href="notice_detail?num=${n.num}">
      		${n.title}
      	</a>
      </td>
      <td>${n.writer}</td>
      <td>${n.writeday}</td>
      <td>${n.readcnt}</td>
    </tr>
    </c:forEach>
  </table>
  <br>
  
  <div id="page" class="w3-bar" style="text-align: center">
	  <button class="w3-button">&laquo;</button>
		<c:forEach begin="1" end="${totalpage}" var="i">
			<a href="notice_list?pagenum=${i}">
				<button id="${i}" class="w3-button pagenum">${i}</button>
			</a>
		</c:forEach>
	  <button class="w3-button">&raquo;</button>
  </div>
  <br>
  
  <form action="notice_search?pagenum=1" method="post" align="center">
  <select name="category">
  	<option value="title">제목
  	<option value="writer">작성자
  </select>
  <input type="text" name="search">
  <input type="submit" value="검색">
  </form>
</div>

</body>
</html>