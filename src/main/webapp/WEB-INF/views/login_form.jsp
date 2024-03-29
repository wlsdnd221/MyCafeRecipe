<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <!-- 로그인 모달화면 -->
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        <img src="/recipe/image/normal/카페로고.PNG" alt="카페로고" class="w3-margin-top">
      </div>

      <form class="w3-container" action="login" method="post">
        <div class="w3-section">
          <label><b>아이디</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="ID를 입력하세요" name="id" required>
          <label><b>비밀번호</b></label>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호를 입력하세요" name="pw" required>
          <input class="w3-button w3-block w3-brown w3-section w3-padding" type="submit" value="로그인">
          <a href="application_form">
          	<button type="button" class="w3-button w3-block w3-brown w3-section w3-padding">회원가입</button>
          </a>
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">취소</button>
        <span class="w3-right w3-padding w3-hide-small"><a href="#">비밀번호 찾기</a></span>
      </div>

    </div>
  </div>
  <!-- 로그인 모달화면 종료 -->

</body>
</html>