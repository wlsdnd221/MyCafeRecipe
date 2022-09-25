<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
html ,body{
	margin: 0px; padding:0px;
	height: 100%;
}
#body{
	flex: 1;
}
#container {
    display: flex;
    flex-direction: column;
    height: 100%;    
}
#footer {
    padding: 30px 0;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="container">
	<div id="top">
		<tiles:insertAttribute name="top"/>
	</div>
	<div id="body">
		<tiles:insertAttribute name="body"/>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>

</body>
</html>