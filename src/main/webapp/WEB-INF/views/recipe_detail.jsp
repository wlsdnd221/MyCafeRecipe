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

<div class="w3-card-4" style="width: 70%; margin-left: auto; margin-right: auto">
  <div class="w3-container w3-brown">
    <h2>${rbdto.title}</h2>
  </div>
    <p class="w3-border-bottom w3-border-brown" style="text-align: right">      
	    <label class="w3-text-brown"><b>작성자 : </b></label>${rbdto.writer}&emsp;
	    <label class="w3-text-brown"><b>작성일 : </b></label>${rbdto.writeday}&emsp;
	    <label class="w3-text-brown"><b>조회수 : </b></label>${rbdto.readcnt}&emsp;
    </p>
    <div style="width: 97%; margin-left: auto; margin-right: auto">
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
		</div>	    
    
    <br>
    <label class="w3-text-brown"><b>상세설명(주문요청사항 등등 자세하게!)</b></label>
    <div class="w3-input w3-border w3-sand">
    	<c:choose>
    		<c:when test="${rbdto.picture != null}">
    			<img src="/recipe/image/recipe/${rbdto.picture}"><br><br>
    		</c:when>
    	</c:choose>
    	${rbdto.content}
    </div>
	<br>
	<table style="width: 100%">
	<tr>
		<td>
			<c:choose>
				<c:when test="${logon==true && mbdto!=ull }">
					<p>
						<a href="recipe_modify_input?num=${rbdto.num}">
			      		    <input type="button" class="w3-btn  w3-red" value="수정">
			      	    </a>
			      		<input type="button" class="w3-btn w3-red" value="삭제" onclick="del('${rbdto.num}', '${rbdto.cafe}')">
		      	    </p>
			    </c:when>
			</c:choose>
		</td>
		<td>
			<p align="right">
				<c:choose>
					<c:when test="${logon==true && mbdto!=ull }">
					<a href="recipe_reply_input?num=${rbdto.num}">
			    		<input type="button" class="w3-btn w3-brown" value="답글달기">
			    	</a>
			    	 </c:when>
				</c:choose>
		    	<a href="recipe_list?cafename=${rbdto.cafe}">
		    		<input type="button" class="w3-btn w3-brown" value="목록으로">
		    	</a>
	    	</p>
		</td>
	</tr>	
    </table>
    </div>
</div>

<script type="text/javascript">
function del(num, cafename){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href='recipe_delete?num='+num+'&cafename='+cafename;
		alert("삭제되었습니다.");
	}
	else
	{}
}
</script>

</body>
</html>