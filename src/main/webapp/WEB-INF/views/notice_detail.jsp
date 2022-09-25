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
    <h2>${nodto.title}</h2>
  </div>
    <p class="w3-border-bottom w3-border-brown" style="text-align: right">      
	    <label class="w3-text-brown"><b>작성자 : </b></label>${nodto.writer}&emsp;
	    <label class="w3-text-brown"><b>작성일 : </b></label>${nodto.writeday}&emsp;
	    <label class="w3-text-brown"><b>조회수 : </b></label>${nodto.readcnt}&emsp;
    </p>
    <br>
    <div class="w3-input w3-border w3-sand">
    	<c:choose>
    		<c:when test="${nodto.picture != null}">
    			<img src="/recipe/image/normal/${nodto.picture}"><br><br>
    		</c:when>
    	</c:choose>
    	${nodto.content}
    </div>
	<br>
	<table style="width: 100%">
	<tr>
		<td>
			<c:choose>
				<c:when test="${logon==true && mbdto!=ull }">
					<p>
						<a href="notice_modify_input?num=${nodto.num}">
			      		    <input type="button" class="w3-btn  w3-red" value="수정">
			      	    </a>
			      		<input type="button" class="w3-btn w3-red" value="삭제" onclick="del('${nodto.num}')">
		      	    </p>
			    </c:when>
			</c:choose>
		</td>
		<td>
			<p align="right">
		    	<a href="notice_list">
		    		<input type="button" class="w3-btn w3-brown" value="목록으로">
		    	</a>
	    	</p>
		</td>
	</tr>	
    </table>
</div>

<script type="text/javascript">
function del(num){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href='notice_delete?num='+num;
		alert("삭제되었습니다.");
	}
	else
	{}
}
</script>

</body>
</html>