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

<table align="center" width="1000" height="600">
<tr>
	<td width="400" height="600" style="text-align: center">
		<img src="/recipe/image/${mndto.cafe}/${mndto.picture}" id="preview" width="400" height="600">
	</td>
	<td>
		<div class="w3-container">
		  <div class="w3-card-4">
		    <header class="w3-container w3-brown">
      			<h1>상품상세</h1>
		    </header>
		
		    <div class="w3-container">		    
				<table align="center" width="100%">
				<tr>
					<td>
						<p style="width: 80%">
					      <label class="w3-text-brown"><b>카페</b></label>
					      <c:choose>
					      	<c:when test="${mndto.cafe=='starbucks'}">
					      		<input class="w3-input w3-border w3-sand" type="text" value="스타벅스" readonly>
					      	</c:when>
					      	<c:when test="${mndto.cafe=='hollys'}">
					      		<input class="w3-input w3-border w3-sand" type="text" value="할리스" readonly>
					      	</c:when>
					      	<c:when test="${mndto.cafe=='ediya'}">
					      		<input class="w3-input w3-border w3-sand" type="text" value="이디야" readonly>
					      	</c:when>
					      </c:choose>
						</p>
					</td>
					<td>
						<p style="width: 80%">
					      <label class="w3-text-brown"><b>분류</b></label>
					      <c:choose>
					      	<c:when test="${mndto.sort=='beverage'}">
					      		<input class="w3-input w3-border w3-sand" type="text" value="음료" readonly>
					      	</c:when>
					      	<c:when test="${mndto.sort=='food'}">
					      		<input class="w3-input w3-border w3-sand" type="text" value="푸드" readonly>
					      	</c:when>
					      	<c:when test="${mndto.sort=='topping'}">
					      		<input class="w3-input w3-border w3-sand" type="text" value="토핑" readonly>
					      	</c:when>
					      </c:choose>
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p p style="width: 90%">      
						  <label class="w3-text-brown"><b>상품명</b></label>
						  <input class="w3-input w3-border w3-sand" type="text" value="${mndto.product}" readonly>
						</p>
						<p p style="width: 90%">      
						  <label class="w3-text-brown"><b>설명</b></label>
						  <textarea class="w3-input w3-border w3-sand" rows="5" cols="10" readonly>${mndto.explain}</textarea>
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<br>
						<h4>영양정보</h4>
					</td>
				</tr>
				<tr>
					<td>
						<p style="width: 80%">      
					      <label class="w3-text-brown"><b>칼로리(kcal)</b></label>
					      <input class="w3-input w3-border w3-sand" type="text" value="${mndto.ndto.calorie}" readonly>
					    </p>					 
					    <p style="width: 80%">      
					      <label class="w3-text-brown"><b>포화지방(g)</b></label>
					      <input class="w3-input w3-border w3-sand" type="text" value="${mndto.ndto.saturated_fat}" readonly>
					    </p>
					    <p style="width: 80%">      
					      <label class="w3-text-brown"><b>단백질(g)</b></label>
					      <input class="w3-input w3-border w3-sand" type="text" value="${mndto.ndto.protein}" readonly>
					    </p>					    
					</td>
					<td>
						<p style="width: 80%">      
					      <label class="w3-text-brown"><b>나트륨(mg)</b></label>
					      <input class="w3-input w3-border w3-sand" type="text" value="${mndto.ndto.natrium}" readonly>
					    </p>					
					    <p style="width: 80%">      
					      <label class="w3-text-brown"><b>당류(g)</b></label>
					      <input class="w3-input w3-border w3-sand" type="text" value="${mndto.ndto.sugar}" readonly>
					    </p>					    
					    <p style="width: 80%">      
					      <label class="w3-text-brown"><b>카페인(mg)</b></label>
					      <input class="w3-input w3-border w3-sand" type="text" value="${mndto.ndto.caffeine}" readonly>
					    </p>					    
					</td>
				</tr>
					<tr>
						<td>
							<c:choose>
								<c:when test="${logon==true && mbdto!=ull }">
									<a href="cafe_menu_modify_input?num=${mndto.num}">
						      		    <input type="button" class="w3-btn  w3-red" value="수정">
						      	    </a>
						      		<input type="button" class="w3-btn w3-red" value="삭제" onclick="del('${mndto.num}', '${mndto.cafe}')">
				      	    	</c:when>
							</c:choose>	
						</td>
						<td>
							<p align="right">
								<a href="cafe_menu_list?cafename=${cafename}&pagenum=1">
						      		<input type="button" class="w3-btn w3-brown" value="목록으로">
						      	</a>
							</p>
						</td>
					</tr>
				</table>
		    </div>
		    <footer class="w3-container w3-brown">
		      <h5>MyCafeRecipe</h5>
		    </footer>
		  </div>
		</div>
	</td>
</tr>
</table>

<script type="text/javascript">
function del(num, cafename){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href='cafe_menu_delete?num='+num+'&cafename='+cafename;
		alert("삭제되었습니다.");
	}
	else
	{}
}
</script>

</body>
</html>