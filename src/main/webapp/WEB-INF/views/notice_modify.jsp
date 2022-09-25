<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="w3-card-4" style="width: 70%; margin-left: auto; margin-right: auto">
  <div class="w3-container w3-brown">
    <h2>공지사항 수정</h2>
  </div>
  <form class="w3-container" action="notice_modify?num=${nodto.num}" method="post" enctype="multipart/form-data">
    <p>      
	    <label class="w3-text-brown"><b>작성자</b></label>
	    <input class="w3-input w3-border w3-sand" name="writer" type="text" value="${nodto.writer}" readonly>
    </p>
    <p>      
	    <label class="w3-text-brown"><b>제목</b></label>
	    <input class="w3-input w3-border w3-sand" name="title" type="text" value="${nodto.title}" >
    </p>
    <p>      
	    <label class="w3-text-brown" style="float: left"><b>이미지 교체</b></label>&emsp;
	    <button type="button" id="btn_submit" onclick="javascript:fn_submit()">선택파일 업로드</button>
	    <input class="w3-input w3-border w3-sand" id="picture" name="picture" type="file">
	</p>
	<p>      
	    <label class="w3-text-brown"><b>내용</b></label>
	    <textarea class="w3-input w3-border w3-sand" rows="20" cols="80" name="content">${nodto.content}</textarea>
	</p>
    <p align="right">
    	<input type="submit" class="w3-btn w3-brown" value="글 수정">
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
             url : "notice_upload"
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