<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

function ndetailDel(){
	if(confirm("삭제하시겠습니까?")){
		location.href="./ndetailDel?nno=${nd.nno}";
	}
}

function ndetailUp(){
	if(confirm("수정하시겠습니까?")){
		location.href="./ndetailUp?nno=${nd.nno}";
	}
}
</script>

</head>
<body>
<%@ include file="nav.jsp" %>
<%@ include file="sidebar.jsp" %>
 <article id="article">
 <br>	
eno : ${nd.eno } <br>
글번호 : ${nd.nno } <br>
제목 : ${nd.ntitle } <br>
내용 : ${nd.ncontent }<br>
글쓴이 : ${nd.ename } <br>
날짜 : ${nd.ndate } <br>
<button class="ndetailDel" onclick="ndetailDel()">삭제</button>
<button class="ndetailUp" onclick="ndetailUp()">수정</button>
</article>
</body>
</html>