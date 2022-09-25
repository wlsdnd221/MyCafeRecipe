<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdnB3.jsp"/>
<jsp:include page="recipe_modal.jsp"/>
<title>Insert title here</title>
</head>
<body>

<div class="w3-card-4" style="width: 70%; margin-left: auto; margin-right: auto">
  <div class="w3-container w3-brown">
    <h2>레시피 작성</h2>
  </div>
  <form class="w3-container" action="recipe_enroll" method="post" enctype="multipart/form-data">
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
	    <label class="w3-text-brown"><b>음료명(개성있는 이름을 지어주세요!)</b></label>
	    <input class="w3-input w3-border w3-sand" name="title" type="text">
    </p>
    <div>
	    <label class="w3-text-brown"><b>레시피(토핑추가는 최대 5개!!)</b> <button id="initialization" class="w3-button w3-border w3-tiny w3-round" type="button">초기화</button></label>
	    <div class="w3-input w3-border w3-sand">
		    <table style="text-align: center">
		    <tr style="border-bottom: 1">
		    	<td width="70"></td>
		    	<td width="200">베이스음료</td>
		    	<td width="200">토핑추가1</td>
		    	<td width="200">토핑추가2</td>
		    	<td width="200">토핑추가3</td>
		    	<td width="200">토핑추가4</td>
		    	<td width="200">토핑추가5</td>
		    </tr>
		    <tr id="cho">
		    	<td width="70">
		    		<button type="button" class="w3-button w3-xlarge w3-brown" onclick="document.getElementById('menu').style.display='block'">+</button>
		    	</td>
		    </tr>
		    </table>
		    <input id="rec1" class="rec" type="hidden" name="rec1" value="0">
		    <input id="rec2" class="rec" type="hidden" name="rec2" value="0">
		    <input id="rec3" class="rec" type="hidden" name="rec3" value="0">
		    <input id="rec4" class="rec" type="hidden" name="rec4" value="0">
		    <input id="rec5" class="rec" type="hidden" name="rec5" value="0">
		    <input id="rec6" class="rec" type="hidden" name="rec6" value="0">
	    </div>
	</div>
	<br>
	<p>
	    <label class="w3-text-brown" style="float: left"><b>완성된 실제음료!</b></label>&emsp;
	    <button type="button" id="btn_submit" onclick="javascript:fn_submit()">선택파일 업로드</button>
	    <input class="w3-input w3-border w3-sand" id="picture" name="picture" type="file">
    </p>
	<br>
	<p>      
	    <label class="w3-text-brown"><b>상세설명(주문요청사항 등등 자세하게!)</b></label>
	    <textarea class="w3-input w3-border w3-sand" rows="20" cols="80" name="content"></textarea>
	</p>
    <p align="right">
    	<input type="submit" class="w3-btn w3-brown" value="글 등록">
    </p>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
//파일 업로드
function fn_submit(){
        
        var form = new FormData();
        form.append( "picture", $("#picture")[0].files[0] );
        
         jQuery.ajax({
             url : "recipe_upload"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               alert("파일업로드 성공!");
               console.log(response);
           }
           ,error: function () 
           { 
               alert("다시 시도해주세요!"); 
           }
       });
}
</script>

</body>
</html>