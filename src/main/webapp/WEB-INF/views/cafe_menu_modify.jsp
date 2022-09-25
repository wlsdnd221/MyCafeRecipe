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

<table align="center" width="1000" height="600">
<tr>
	<td width="400" height="600" style="text-align: center">
		이미지 미리보기<br>
		<img id="preview" src="/recipe/image/${mndto.picture}" width="400" height="600">
	</td>
	<td>
		<div class="w3-container">
		  <div class="w3-card-4">
		    <header class="w3-container w3-brown">
		      <h1>상품수정</h1>
		    </header>
		
		    <div class="w3-container">		    
		      <form id="form" class="w3-container" action="cafe_menu_modify?num=${mndto.num}" method="post" enctype="multipart/form-data">
				<table align="center" width="100%">
				<tr>
					<td>
						<p style="width: 80%">
					      <label class="w3-text-brown"><b>카페</b></label>
						  <select class="w3-select w3-border w3-sand" id="cafe" name="cafe">
						    <option value="" disabled>선택</option>
						    <option value="starbucks" <c:if test="${mndto.cafe == 'starbucks'}">selected</c:if> class="w3-text-brown">스타벅스</option>
						    <option value="hollys" <c:if test="${mndto.cafe == 'hollys'}">selected</c:if> class="w3-text-brown">할리스</option>
						    <option value="ediya" <c:if test="${mndto.cafe == 'ediya'}">selected</c:if> class="w3-text-brown">이디야</option>
						  </select>
						</p>
					</td>
					<td>
						<p style="width: 80%">
					      <label class="w3-text-brown"><b>분류</b></label>
						  <select class="w3-select w3-border w3-sand" id="sort" name="sort">
						    <option value="" disabled>선택</option>
						    <option value="beverage" <c:if test="${mndto.sort == 'beverage'}">selected</c:if> class="w3-text-brown">음료</option>
						    <option value="food" <c:if test="${mndto.sort == 'food'}">selected</c:if> class="w3-text-brown">푸드</option>
						    <option value="topping" <c:if test="${mndto.sort == 'topping'}">selected</c:if> class="w3-text-brown">토핑</option>
						  </select>
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p p style="width: 90%">  
						  <label class="w3-text-brown"><b>이미지 선택</b></label>&emsp;
						   <button type="button" id="btn_submit" onclick="javascript:fn_submit()">선택파일 업로드</button>
						  <input type="file" class="w3-input w3-border w3-sand" id="picture" onchange="readURL(this);" name="picture" value="${mndto.picture}">
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p p style="width: 90%">      
						  <label class="w3-text-brown"><b>상품명</b></label>
						  <input class="w3-input w3-border w3-sand" id="product" name="product" type="text" value="${mndto.product}">
						</p>
						<p p style="width: 90%">      
						  <label class="w3-text-brown"><b>설명</b></label>
						  <textarea class="w3-input w3-border w3-sand" name="explain" rows="5" cols="10">${mndto.explain}</textarea>
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
					      <input class="w3-input w3-border w3-sand" id="calorie" name="calorie" type="text" value="${mndto.ndto.calorie}">
					    </p>					 
					    <p style="width: 80%">      
					      <label class="w3-text-brown"><b>포화지방(g)</b></label>
					      <input class="w3-input w3-border w3-sand" id="saturated_fat" name="saturated_fat" type="text" value="${mndto.ndto.saturated_fat}">
					    </p>
					    <p style="width: 80%">      
					      <label class="w3-text-brown"><b>단백질(g)</b></label>
					      <input class="w3-input w3-border w3-sand" id="protein" name="protein" type="text" value="${mndto.ndto.protein}">
					    </p>					    
					</td>
					<td>
						<p style="width: 80%">      
					      <label class="w3-text-brown"><b>나트륨(mg)</b></label>
					      <input class="w3-input w3-border w3-sand" id="natrium" name="natrium" type="text" value="${mndto.ndto.natrium}">
					    </p>					
					    <p style="width: 80%">      
					      <label class="w3-text-brown"><b>당류(g)</b></label>
					      <input class="w3-input w3-border w3-sand" id="sugar" name="sugar" type="text" value="${mndto.ndto.sugar}">
					    </p>					    
					    <p style="width: 80%">      
					      <label class="w3-text-brown"><b>카페인(mg)</b></label>
					      <input class="w3-input w3-border w3-sand" id="caffeine" name="caffeine" type="text" value="${mndto.ndto.caffeine}">
					    </p>					    
					</td>
				</tr>
				</table>
			      <p align="right">
			      	<input type="button" class="w3-btn w3-brown" value="수정하기" onclick="check()">
			      </p>
			  </form>
		    </div>
		
		    <footer class="w3-container w3-brown">
		      <h5>MyCafeRecipe</h5>
		    </footer>
		  </div>
		</div>
	</td>
</tr>
</table>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//파일 업로드
function fn_submit(){
	
	if($("#cafe option:selected").val() == "")
	{
		alert("파일업로드 전 반드시 카페를 먼저 선택하세요.");
		return false;
	}
	else
	{
		var cafe = $("#cafe").val();
	       var form = new FormData();
	       form.append( "picture", $("#picture")[0].files[0] );
	       
	        jQuery.ajax({
	            url : "cafe_menu_upload?cafe="+cafe
	          , type : "POST"
	          , processData : false
	          , contentType : false
	          , data : form
	          , success:function(response) {
	              alert("파일업로드 성공!");
	              console.log(response);
	          }
	          ,error: function (jqXHR) 
	          { 
	              alert(jqXHR.responseText); 
	          }
	      });
	}
}

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
}

function check()
{
	var calorie = $("#calorie").val();
	var saturated_fat = $("#saturated_fat").val();
	var protein = $("#protein").val();
	var natrium = $("#natrium").val();
	var sugar = $("#sugar").val();
	var caffeine = $("#caffeine").val();
	
	var check_num = /[0-9]/; // 숫자 
	var check_eng = /[a-zA-Z]/; // 문자 
	var check_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
	
	if($("#cafe option:selected").val() == "")
	{
		alert("카페를 선택하세요.");
		return false;
	}
	else if($("#sort option:selected").val() == "")
	{
		alert("분류를 선택하세요.");
		return false;
	}
	else if($("#product").val() == "")
	{
		alert("상품명을 입렵하세요.");
		return false;
	}
	else if(!check_num.test(calorie))
	{
		alert("영양정보는 숫자만 입력 가능합니다.");
		return false;
	}
	else if(!check_num.test(saturated_fat))
	{
		alert("영양정보는 숫자만 입력 가능합니다.");
		return false;
	}
	else if(!check_num.test(protein))
	{
		alert("영양정보는 숫자만 입력 가능합니다.");
		return false;
	}
	else if(!check_num.test(natrium))
	{
		alert("영양정보는 숫자만 입력 가능합니다.");
		return false;
	}
	else if(!check_num.test(sugar))
	{
		alert("영양정보는 숫자만 입력 가능합니다.");
		return false;
	}
	else if(!check_num.test(caffeine))
	{
		alert("영양정보는 숫자만 입력 가능합니다.");
		return false;
	}
	
	return $("#form").submit();
}
</script>

</body>
</html>