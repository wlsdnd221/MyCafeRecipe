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

<div id="menu" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
  <header class="w3-container w3-blue"> 
   <span onclick="document.getElementById('menu').style.display='none'" 
   class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
   <h2>메뉴선택</h2>
  </header>

  <div class="w3-bar w3-border-bottom">
   <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'London')">음료</button>
   <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'Paris')">푸드</button>
   <button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'Tokyo')">토핑</button>
  </div>

  <div id="London" class="w3-container city">
   <c:forEach items="${beverage}" var="b">
	   <div class="col-md-2" onclick="cho('${b.cafe}', '${b.picture}', '${b.product}', '${b.num}')">
	     <div class="thumbnail">
	         <img src="/recipe/image/${b.cafe}/${b.picture}" style="width:100px; height: 100px">
	         <div class="caption" style="text-align: center">
	           <p class="product" style="text-align: center">${b.product}</p>
	         </div>
	     </div>
	   </div>
   </c:forEach>
  </div>

  <div id="Paris" class="w3-container city">
   <c:forEach items="${food}" var="f">
	   <div class="col-md-2" onclick="cho('${f.cafe}', '${f.picture}', '${f.product}', '${f.num}')">
	     <div class="thumbnail">
	         <img src="/recipe/image/${f.cafe}/${f.picture}" style="width:100px; height: 100px">
	         <div class="caption" style="text-align: center">
	           <p class="product" style="text-align: center">${f.product}</p>
	         </div>
	     </div>
	   </div>
   </c:forEach>
  </div>

  <div id="Tokyo" class="w3-container city">
   <c:forEach items="${topping}" var="t">
	   <div class="col-md-2" onclick="cho('${t.cafe}', '${t.picture}', '${t.product}', '${t.num}')">
	     <div class="thumbnail">
	         <img src="/recipe/image/${t.cafe}/${t.picture}" style="width:100px; height: 100px">
	         <div class="caption" style="text-align: center">
	           <p class="product" style="text-align: center">${t.product}</p>
	         </div>
	     </div>
	   </div>
   </c:forEach>
  </div>

  <div class="w3-container w3-light-grey w3-padding">
   <button class="w3-button w3-right w3-white w3-border" 
   onclick="document.getElementById('menu').style.display='none'">Close</button>
  </div>
 </div>
</div>

<script>
document.getElementsByClassName("tablink")[0].click();

function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].classList.remove("w3-light-grey");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.classList.add("w3-light-grey");
}

function cho(cafe, picture, product, num){
	
	$("#cho").append('<td id="before" width="200"><table align="center"><tr><td><img style="width: 100px; height: 100px" src="/recipe/image/'+cafe+'/'+picture+'"></td></tr><tr><td>'+product+'</td></tr></table></td>');
	
	var v1 = document.getElementById('rec1').value;
	var v2 = document.getElementById('rec2').value;
	var v3 = document.getElementById('rec3').value;
	var v4 = document.getElementById('rec4').value;
	var v5 = document.getElementById('rec5').value;
	var v6 = document.getElementById('rec6').value;
	
	if(v1 == "0" || v1 == "")
	{
		$("#rec1").val(num);
	}
	else if(v2 == "0" || v2 == "")
	{
		$("#rec2").val(num);
	}
	else if(v3 == "0" || v3 == "")
	{
		$("#rec3").val(num);
	}
	else if(v4 == "0" || v4 == "")
	{
		$("#rec4").val(num);
	}
	else if(v5 == "0" || v5 == "")
	{
		$("#rec5").val(num);
	}
	else if(v6 == "0" || v6 == "")
	{
		$("#rec6").val(num);
	}
	
	document.getElementById('menu').style.display='none'
}

$(document).ready(function(){
	$("#initialization").click(function(){
		$("td").remove("#before");
		$(".rec").val(0);
	})
})

</script>

</body>
</html>