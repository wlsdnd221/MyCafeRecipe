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

<div class="w3-card-4" style="width: 70%; margin-left: auto; margin-right: auto">
  <div class="w3-container w3-brown">
    <h2>레시피 작성</h2>
  </div>
  <form class="w3-container" action="recipe_reply?groups=${rbdto.groups}&step=${rbdto.step}&indent=${rbdto.indent}" method="post" enctype="multipart/form-data">
    <p>      
	    <label class="w3-text-brown"><b>작성자</b></label>
	    <input class="w3-input w3-border w3-sand" name="writer" type="text" value="${mbdto.id}" readonly>
    </p>
    <p>
    	<label class="w3-text-brown"><b>카페분류</b></label>
    	<select class="w3-select w3-border w3-sand" name="cafe">
		    <option value="" disabled selected>선택</option>
		    <option value="starbucks" <c:if test="${cafename eq 'starbucks'}">selected</c:if> class="w3-text-brown">스타벅스</option>
		    <option value="hollys" <c:if test="${cafename eq 'hollys'}">selected</c:if> class="w3-text-brown">할리스</option>
		    <option value="ediya" <c:if test="${cafename eq 'ediya'}">selected</c:if> class="w3-text-brown">이디야</option>
	  	</select>
    </p>
    <p>
	    <label class="w3-text-brown"><b>제목</b></label>
	    <input class="w3-input w3-border w3-sand" name="title" type="text">
    </p>
     <div>
	    <label class="w3-text-brown"><b>레시피</b></label>
	    <div class="w3-input w3-border w3-sand">
		    <table style="text-align: center">
		    <tr>
		    	<td width="200">베이스음료</td>
		    	<td width="200">토핑추가1</td>
		    	<td width="200">토핑추가2</td>
		    	<td width="200">토핑추가3</td>
		    	<td width="200">토핑추가4</td>
		    	<td width="200">토핑추가5</td>
		    </tr>
		    <tr>
		    	<c:forEach items="${lista}" var="rec">
		    	<td>
		    		<table align="center">
		    		<tr>
		    			<td>
		    				<c:choose>
		    					<c:when test="${rec.picture eq null}"></c:when>
		    					<c:otherwise>
		    						<img src="/recipe/image/${rbdto.cafe}/${rec.picture}" style="width: 100px; height: 100px">
		    					</c:otherwise>
		    				</c:choose>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>${rec.product}</td>
		    		</tr>
		    		</table>
		    	</td>
		    	</c:forEach>
		    </tr>
		    </table>
		    <c:choose>
		    	<c:when test="${lista[0].num == null }">
		    		<c:set value="0" var="rec1"/>
		    	</c:when>
		    	<c:otherwise>
		    		<c:set value="${lista[0].num}" var="rec1"/>
		    	</c:otherwise>
		    </c:choose>
		    <c:choose>
		    	<c:when test="${lista[1].num == null }">
		    		<c:set value="0" var="rec2"/>
		    	</c:when>
		    	<c:otherwise>
		    		<c:set value="${lista[1].num}" var="rec2"/>
		    	</c:otherwise>
		    </c:choose>
		    <c:choose>
		    	<c:when test="${lista[2].num == null }">
		    		<c:set value="0" var="rec3"/>
		    	</c:when>
		    	<c:otherwise>
		    		<c:set value="${lista[2].num}" var="rec3"/>
		    	</c:otherwise>
		    </c:choose>
		    <c:choose>
		    	<c:when test="${lista[3].num == null }">
		    		<c:set value="0" var="rec4"/>
		    	</c:when>
		    	<c:otherwise>
		    		<c:set value="${lista[3].num}" var="rec4"/>
		    	</c:otherwise>
		    </c:choose>
		    <c:choose>
		    	<c:when test="${lista[4].num == null }">
		    		<c:set value="0" var="rec5"/>
		    	</c:when>
		    	<c:otherwise>
		    		<c:set value="${lista[4].num}" var="rec5"/>
		    	</c:otherwise>
		    </c:choose>
		    <c:choose>
		    	<c:when test="${lista[5].num == null }">
		    		<c:set value="0" var="rec6"/>
		    	</c:when>
		    	<c:otherwise>
		    		<c:set value="${lista[5].num}" var="rec6"/>
		    	</c:otherwise>
		    </c:choose>
		    
		    <input id="rec1" class="rec" type="hidden" name="rec1" value="${rec1}">
		    <input id="rec2" class="rec" type="hidden" name="rec2" value="${rec2}">
		    <input id="rec3" class="rec" type="hidden" name="rec3" value="${rec3}">
		    <input id="rec4" class="rec" type="hidden" name="rec4" value="${rec4}">
		    <input id="rec5" class="rec" type="hidden" name="rec5" value="${rec5}">
		    <input id="rec6" class="rec" type="hidden" name="rec6" value="${rec6}">
		</div>
	</div>	    
	<br>
	<p>
	    <label class="w3-text-brown"><b>완성된 실제음료!</b></label>
	    <input class="w3-input w3-border w3-sand" name="picture" type="file">
    </p>
	<br>
	<p>      
	    <label class="w3-text-brown"><b>내용</b></label>
	    <textarea class="w3-input w3-border w3-sand" rows="20" cols="80" name="content"></textarea>
	</p>
    <p align="right">
    	<input type="submit" class="w3-btn w3-brown" value="글 등록">
    </p>
  </form>
</div>

</body>
</html>