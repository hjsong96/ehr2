<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<%@ include file="nav.jsp" %>
<%@ include file="sidebar.jsp" %>
 <article id="article">
 <br>	

<form action="./noticeWrite" method="post" >
<input type="hidden" name="eno" value="${eno}">
제목<input type="text" id="ntitle" name="ntitle"><br>
내용<textarea name="ncontent"></textarea><br>
<button type="submit">저장</button>
</form>
</article>
</body>
</html>