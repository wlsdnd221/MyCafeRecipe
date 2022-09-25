<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="cdnB3.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>

<div class="w3-container" style="width: 40%; margin-left: auto; margin-right: auto">
  <div class="w3-card-4">
    <header class="w3-container w3-brown">
      <h1>회원가입</h1>
    </header>
	<br>
	<div style="width: 80%; margin-left: auto; margin-right: auto">
	<form id="form" class="form-horizontal" action="application_enroll" method="post">
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="id">아이디:</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" name="id">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="pw">비밀번호:</label>
	    <div class="col-sm-10">          
	      <input type="password" class="form-control" id="pw" placeholder="비밀번호를 입력하세요" name="pw">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="name">이름:</label>
	    <div class="col-sm-10">          
	      <input type="name" class="form-control" id="name" placeholder="홍길동" name="name">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="birthday">생년월일:</label>
	    <div class="col-sm-10">          
	      <input type="date" class="form-control" id="birthday" name="birthday">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="phon">전화번호:</label>
	    <div class="col-sm-10">          
	      <input type="text" class="form-control" id="phon" placeholder="010-0000-0000" name="phon">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="email">이메일:</label>
	    <div class="col-sm-10">          
	      <input type="text" class="form-control" id="email" placeholder="mycaferecipe@naver.com" name="email">
	    </div>
	  </div>
	  <div class="form-group">        
	    <div align="right">
	      	<input type="button" class="w3-btn w3-brown" value="등록하기" onclick="check()">
	    </div>
	  </div>
	</form>
	</div>

    <footer class="w3-container w3-brown">
      <h5>MyCafeRecipe</h5>
    </footer>
  </div>
</div>

<script type="text/javascript">
function check()
{
	if($("#id").val() == "")
	{
		alert("아이디를 입력하세요.");
		return false;
	}
	else if($("#pw").val() == "")
	{
		alert("비밀번호를 입력하세요.");
		return false;
	}
	else if($("#name").val() == "")
	{
		alert("이름을 입력하세요.");
		return false;
	}
	else if($("#birthday").val() == "")
	{
		alert("생년월일을 입력하세요.");
		return false;
	}
	else if($("#phon").val() == "")
	{
		alert("전화번호를 입력하세요.");
		return false;
	}
	else if($("#email").val() == "")
	{
		alert("이메일을 입력하세요.");
		return false;
	}
	
	return $("#form").submit();
}
</script>

</body>
</html>